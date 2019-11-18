#Cleaning database
puts "Destroying license transactions..."
LicenseTransaction.destroy_all

puts "Destroying company licenses..."
CompanyLicense.destroy_all

puts "Destroying licenses..."
License.destroy_all

puts "Destroying categories..."
Category.destroy_all

puts "Destroying vendors..."
Vendor.destroy_all

puts "Destroying users..."
User.destroy_all

puts "Destroying companies..."
Company.destroy_all

#Creating entries
companies = [
  {name: "Company X"},
  {name: "Company Y"}
]

puts "Creating companies..."
  companies.each do |company|
    Company.create!(company)
  end
puts "Finished creating companies..."

users = [
  {email: "employee1@example.com", password: "123456", company: Company.all.sample},
  {email: "employee2@example.com", password: "123456", company: Company.all.sample}
]

puts "Creating users..."
  users.each do |user|
    User.create!(user)
  end
puts "Finished creating users..."

vendors = [
  {name: "Microsoft"},
  {name: "Slack corp."}
]

puts "Creating vendors..."
  vendors.each do |vendor|
    Vendor.create!(vendor)
  end
puts "Finished creating vendors..."

categories = [
  {name: "Filesharing"},
  {name: "Communication"}
]

puts "Creating categories..."
  categories.each do |category|
    Category.create!(category)
  end
puts "Finished creating categories..."

licenses = [
  {name: "E3", category: Category.all.sample, vendor: Vendor.all.sample},
  {name: "Slack - Personal", category: Category.all.sample, vendor: Vendor.all.sample}
]

puts "Creating licenses..."
  licenses.each do |license|
    License.create!(license)
  end
puts "Finished creating licenses..."


company_licenses = [
  {license: License.all.sample, company: Company.all.sample, owner: User.all.sample},
  {license: License.all.sample, company: Company.all.sample, owner: User.all.sample}
]

puts "Creating company licenses..."
  company_licenses.each do |company_license|
    CompanyLicense.create!(company_license)
  end
puts "Finished creating company licenses..."

license_transactions = [
  {purchase_price: rand(1000..20000), company_license: CompanyLicense.all.sample},
  {purchase_price: rand(1000..20000), company_license: CompanyLicense.all.sample}
]

puts "Creating license transactions..."
  license_transactions.each do |license_transaction|
    LicenseTransaction.create!(license_transaction)
  end
puts "Finished creating license transactions..."
