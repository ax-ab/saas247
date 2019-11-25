class LicenseTransaction < ApplicationRecord
  belongs_to :company_license
  belongs_to :owner, class_name: 'User'

  def add_purchase_date(period)
    case period
    when 'monthly'  then self.purchase_date = Date.today - rand(0..365)
    when 'yearly'   then self.purchase_date = Date.today - rand(0..730)
    end
    save
  end

  def add_expiry_date(period)
    case period
    when 'monthly' then self.expiry_date = purchase_date + 30
    when 'yearly'  then self.expiry_date = purchase_date + 365
    end
    save
  end

  def add_owner
    self.owner = User.all.sample
    save
  end

  scope :aggregated_capacity, -> (company) {
    joins(:company_license)
    .where(company_licenses: {company: company})
    .where("'#{Date.today}' BETWEEN license_transactions.purchase_date AND license_transactions.expiry_date")
    .sum(:user_licenses_purchased)
  }
end
