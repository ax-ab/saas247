class CompanyLicense < ApplicationRecord
  belongs_to :license
  belongs_to :company
  has_many :license_transactions
  has_many :license_usages

  scope :company_applications_count, -> (company) {
    joins(:license)
    .where(company: company)
    .count('distinct name')
  }

  scope :aggregated_usage, -> (company) {
    where(company: company)
    .sum(:active_users)
  }

  scope :spend_per_app, -> (company) {
    select("company_licenses.id,
    licenses.name AS key, max(licenses.logo_url) AS logo,
    SUM(total_purchase_price) AS expense
    ")
    .joins(:license_transactions, :license)
    .where(company: company)
    .where(license_transactions: {purchase_date: Date.today-365..Date.today})
    .group('key, company_licenses.id')
    .order(expense: :desc)
    .limit(5)
  }

  scope :spend_per_department, -> (company) {
    select("
    users.department AS key,
    'vendor-logos/department-placeholder.png' AS logo,
    SUM(license_transactions.total_purchase_price) AS expense
    ")
    .joins({ license_transactions: :owner })
    .where(company: company)
    .where(license_transactions: {purchase_date: Date.today-365..Date.today})
    .group('key')
    .order(expense: :desc)
    .limit(5)
  }

  def self.index_query(company)
    ActiveRecord::Base.connection
    .execute("
    SELECT
      min(lid) AS id,
      min(application) AS application,
      min(logo_url) AS logo_url,
      min(departments) AS departments,
      min(category) AS category,
      min(vendor) AS vendor,
      sum(total_expenses) AS expense,
      sum(capacity) AS capacity,
      sum(usage) AS usage,
      ROUND(SUM(usage) * 100 / SUM(capacity)) AS utilization,
      ((sum(capacity) - sum(usage)) * min(avg_license_cost)) AS saving
    FROM (
      SELECT
        licenses.id AS lid,
        licenses.name AS application,
        licenses.logo_url AS logo_url,
        COUNT(DISTINCT users.department) AS departments,
        categories.name AS category,
        vendors.name AS vendor,
        SUM(license_transactions.total_purchase_price) AS total_expenses,
        NULL AS capacity,
        NULL::INTEGER AS usage,
        licenses.avg_license_cost AS avg_license_cost
      FROM
        license_transactions
        JOIN company_licenses ON company_licenses.id = license_transactions.company_license_id
        JOIN licenses ON licenses.id = company_licenses.license_id
        JOIN categories ON categories.id = licenses.category_id
        JOIN vendors ON vendors.id = licenses.vendor_id
        JOIN users ON users.id = license_transactions.owner_id
      WHERE
        license_transactions.purchase_date BETWEEN '#{Date.today - 365}' AND '#{Date.today}'
        AND company_licenses.company_id = #{ActiveRecord::Base.sanitize_sql(company.id)}
      GROUP BY
        lid,
        application,
        category,
        vendor
      UNION ALL
      SELECT
        licenses.id AS lid,
        licenses.name AS application,
        licenses.logo_url AS logo_url,
        NULL AS departments,
        NULL AS category,
        NULL AS vendor,
        NULL AS total_expenses,
        SUM(license_transactions.user_licenses_purchased) AS capacity,
        NULL::INTEGER AS usage,
        licenses.avg_license_cost AS avg_license_cost FROM
        license_transactions
        JOIN company_licenses ON company_licenses.id = license_transactions.company_license_id
        JOIN licenses ON licenses.id = company_licenses.license_id
      WHERE
        company_licenses.company_id = #{ActiveRecord::Base.sanitize_sql(company.id)}
        AND '#{Date.today}' BETWEEN license_transactions.purchase_date AND license_transactions.expiry_date
      GROUP BY
        lid,
        application
      UNION ALL
      SELECT
        licenses.id AS lid,
        licenses.name AS application,
        licenses.logo_url AS logo_url,
        NULL AS departments,
        NULL AS category,
        NULL AS vendor,
        NULL AS total_expenses,
        NULL AS capacity,
        SUM(company_licenses.active_users) AS usage,
        licenses.avg_license_cost AS avg_license_cost
      FROM
        company_licenses
        JOIN licenses ON licenses.id = company_licenses.license_id
      WHERE
        company_licenses.company_id = #{ActiveRecord::Base.sanitize_sql(company.id)}
      GROUP BY
        lid,
        application
    ) AS core
    GROUP BY
    application
    ")
    .map(&:symbolize_keys)
  end

end
