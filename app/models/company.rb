class Company < ApplicationRecord
  has_many :users
  has_many :company_licenses

  def total_monthly_cost
    totalCost = 0
    totalLicensesPurchased = 0
    owners = 0
    departmentsCount = Hash.new(0)
    ownersCount = Hash.new(0)
    transactionsPerMonths = Hash.new(0)
    company_licenses.each do |company_license|
      company_license.license_transactions.each do |lt|
        dep = lt.owner.department
        departmentsCount[dep] += 1
        totalCost += lt.total_purchase_price
        totalLicensesPurchased += lt.user_licenses_purchased
        ownersCount[lt.owner.email] += 1
        if lt.purchase_date < Date.today && lt.purchase_date > Date.today - 365
          dateFilter = Date.parse("#{lt.purchase_date.year}/#{lt.purchase_date.month}/01")
          transactionsPerMonths[dateFilter] += lt.total_purchase_price
        end
      end
    end
    return transactionsPerMonths
  end
end
