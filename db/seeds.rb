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
  {name: "Company"},
]

puts "\nCreating companies..."
  companies.each do |company|
    Company.create!(company)
  end
puts "Finished creating companies"

users = [
  {email: "user@company.com", password: "123456", department: "IT", company: Company.find_by(name: "Company")},
  {email: "user2@company.com", password: "123456", department: "Sales", company: Company.find_by(name: "Company")},
  {email: "user3@company.com", password: "123456", department: "Marketing", company: Company.find_by(name: "Company")},
  {email: "user4@company.com", password: "123456", department: "HR", company: Company.find_by(name: "Company")},
  {email: "user5@company.com", password: "123456", department: "Finance", company: Company.find_by(name: "Company")}
]

puts "\nCreating users..."
  users.each do |user|
    User.create!(user)
  end
puts "Finished creating users"

vendors = [
  {name: "Slack"},
  {name: "Zoom"},
  {name: "Cisco"},
  {name: "TeamViewer"},
  {name: "Microsoft"},
  {name: "Google"},
  {name: "DocuSign"},
  {name: "Box"},
  {name: "LogMeIn"},
  {name: "Agile Bits"},
  {name: "Dropbox"},
  {name: "Atlassian"},
  {name: "Figma"},
  {name: "Salesforce"},
  {name: "Shopify"},
  {name: "Zendesk"},
]

puts "\nCreating vendors..."
  vendors.each do |vendor|
    Vendor.create!(vendor)
  end
puts "Finished creating vendors"

categories = [
  {name: "Communications"},
  {name: "Business Operations"},
  {name: "Utilities"},
  {name: "Project Management"},
  {name: "Design"},
  {name: "Engineering"},
  {name: "Sales"},
  {name: "Customer Support"},
  {name: "Dev Ops"}
]

puts "\nCreating categories..."
  categories.each do |category|
    Category.create!(category)
  end
puts "Finished creating categories"

licenses = [
  {name: "Slack", license_type: "", category: Category.find_by(name: "Communications"), vendor: Vendor.find_by(name: "Slack")},
  {name: "Microsoft Office 365", license_type: "Business Essentials", category: Category.find_by(name: "Business Operations"), vendor: Vendor.find_by(name: "Microsoft")},
  {name: "Microsoft Office 365", license_type: "Business Premium", category: Category.find_by(name: "Business Operations"), vendor: Vendor.find_by(name: "Microsoft")},
  {name: "Dropbox", license_type: "Standard", category: Category.find_by(name: "Utilities"), vendor: Vendor.find_by(name: "Dropbox")},
  {name: "Dropbox", license_type: "Advanced", category: Category.find_by(name: "Utilities"), vendor: Vendor.find_by(name: "Dropbox")},
  {name: "Zendesk", license_type: "Enterprise", category: Category.find_by(name: "Customer Support"), vendor: Vendor.find_by(name: "Zendesk")},
  {name: "Zendesk", license_type: "Professional", category: Category.find_by(name: "Customer Support"), vendor: Vendor.find_by(name: "Zendesk")},
  {name: "JiRA", license_type: "Standard", category: Category.find_by(name: "Engineering"), vendor: Vendor.find_by(name: "Atlassian")},
  {name: "Salesforce", license_type: "Small Business - Sales Professional", category: Category.find_by(name: "Sales"), vendor: Vendor.find_by(name: "Salesforce")},
  {name: "Google Suite", license_type: "", category: Category.find_by(name: "Business Operations"), vendor: Vendor.find_by(name: "Google")},
  # {name: "Zoom", license_type: "Business", category: Category.find_by(name: "Communications"), vendor: Vendor.find_by(name: "Zoom")},
  # {name: "WebEx", license_type: "Business", category: Category.find_by(name: "Communications"), vendor: Vendor.find_by(name: "Cisco")},
  # {name: "TeamViewer", license_type: "Individual Seat", category: Category.find_by(name: "Communications"), vendor: Vendor.find_by(name: "TeamViewer")},
  # {name: "WebEx", license_type: "Plus", category: Category.find_by(name: "Communications"), vendor: Vendor.find_by(name: "Cisco")},
  # {name: "DocuSign", license_type: "", category: Category.find_by(name: "Communications"), vendor: Vendor.find_by(name: "Slack")},
  # {name: "DocuSign", license_type: "", category: Category.find_by(name: "Communications"), vendor: Vendor.find_by(name: "Slack")},
  # {name: "Box", license_type: "", category: Category.find_by(name: "Communications"), vendor: Vendor.find_by(name: "Slack")},
  # {name: "LastPass", license_type: "", category: Category.find_by(name: "Communications"), vendor: Vendor.find_by(name: "Slack")},
  # {name: "1Password", license_type: "", category: Category.find_by(name: "Communications"), vendor: Vendor.find_by(name: "Slack")},
  # {name: "Trello", license_type: "", category: Category.find_by(name: "Communications"), vendor: Vendor.find_by(name: "Slack")},
  # {name: "Trello", license_type: "", category: Category.find_by(name: "Communications"), vendor: Vendor.find_by(name: "Slack")},
  # {name: "Figma", license_type: "", category: Category.find_by(name: "Communications"), vendor: Vendor.find_by(name: "Slack")},
  # {name: "Figma", license_type: "", category: Category.find_by(name: "Communications"), vendor: Vendor.find_by(name: "Slack")},
  # {name: "Shopify", license_type: "", category: Category.find_by(name: "Communications"), vendor: Vendor.find_by(name: "Slack")},
  # {name: "Github", license_type: "", category: Category.find_by(name: "Communications"), vendor: Vendor.find_by(name: "Slack")}
]

puts "\nCreating licenses..."
  licenses.each do |license|
    License.create!(license)
  end
puts "Finished creating licenses"

company_licenses = [
  {license: License.find_by(name: "Slack", license_type: ""), company: Company.find_by(name: "Company")},
  {license: License.find_by(name: "Microsoft Office 365", license_type: "Business Premium"), company: Company.find_by(name: "Company")},
  {license: License.find_by(name: "Microsoft Office 365", license_type: "Business Essentials"), company: Company.find_by(name: "Company")},
  {license: License.find_by(name: "Dropbox", license_type: "Standard"), company: Company.find_by(name: "Company")},
  {license: License.find_by(name: "Dropbox", license_type: "Advanced"), company: Company.find_by(name: "Company")},
  {license: License.find_by(name: "Zendesk", license_type: "Enterprise"), company: Company.find_by(name: "Company")},
  {license: License.find_by(name: "Zendesk", license_type: "Professional"), company: Company.find_by(name: "Company")},
  {license: License.find_by(name: "JiRA", license_type: "Standard"), company: Company.find_by(name: "Company")},
  {license: License.find_by(name: "Salesforce", license_type: "Small Business - Sales Professional"), company: Company.find_by(name: "Company")},
  {license: License.find_by(name: "Google Suite", license_type: ""), company: Company.find_by(name: "Company")},
]

puts "\nCreating company licenses..."
  company_licenses.each do |company_license|
    CompanyLicense.create!(company_license)
  end
puts "Finished creating company licenses"

license_transactions = [
  {user_licenses_purchased: 200, total_purchase_price: (6.25*200), purchase_date: (Date.today - rand(1..100)), commitment_period: "yearly", company_license: CompanyLicense.find_by(license: License.find_by(name: "Slack", license_type: "")), owner: User.all.sample},
  {user_licenses_purchased: 150, total_purchase_price: (7.5*150), purchase_date: (Date.today - rand(1..100)), commitment_period: "monthly", company_license: CompanyLicense.find_by(license: License.find_by(name: "Slack", license_type: "")), owner: User.all.sample},
  {user_licenses_purchased: 500, total_purchase_price: (4.9*500), purchase_date: (Date.today - rand(1..100)), commitment_period: "yearly", company_license: CompanyLicense.find_by(license: License.find_by(name: "Microsoft Office 365", license_type: "Business Essentials")), owner: User.all.sample},
  {user_licenses_purchased: 300, total_purchase_price: (10.93*300), purchase_date: (Date.today - rand(1..100)), commitment_period: "yearly", company_license: CompanyLicense.find_by(license: License.find_by(name: "Microsoft Office 365", license_type: "Business Premium")), owner: User.all.sample},
  {user_licenses_purchased: 150, total_purchase_price: (12*150), purchase_date: (Date.today - rand(1..100)), commitment_period: "monthly", company_license: CompanyLicense.find_by(license: License.find_by(name: "Dropbox", license_type: "Standard")), owner: User.all.sample},
  {user_licenses_purchased: 100, total_purchase_price: (15*100), purchase_date: (Date.today - rand(1..100)), commitment_period: "yearly", company_license: CompanyLicense.find_by(license: License.find_by(name: "Dropbox", license_type: "Advanced")), owner: User.all.sample},
  {user_licenses_purchased: 10, total_purchase_price: (134.6*10), purchase_date: (Date.today - rand(1..100)), commitment_period: "monthly", company_license: CompanyLicense.find_by(license: License.find_by(name: "Zendesk", license_type: "Enterprise")), owner: User.all.sample},
  {user_licenses_purchased: 15, total_purchase_price: (80.39*15), purchase_date: (Date.today - rand(1..100)), commitment_period: "monthly", company_license: CompanyLicense.find_by(license: License.find_by(name: "Zendesk", license_type: "Professional")), owner: User.all.sample},
  {user_licenses_purchased: 100, total_purchase_price: (6.31*100*12), purchase_date: (Date.today - rand(1..100)), commitment_period: "yearly", company_license: CompanyLicense.find_by(license: License.find_by(name: "JiRA", license_type: "Standard")), owner: User.all.sample},
  {user_licenses_purchased: 100, total_purchase_price: (67.75*100*12), purchase_date: (Date.today - rand(1..100)), commitment_period: "yearly", company_license: CompanyLicense.find_by(license: License.find_by(name: "Salesforce", license_type: "Small Business - Sales Professional")), owner: User.all.sample},
  {user_licenses_purchased: 150, total_purchase_price: (5.2*150), purchase_date: (Date.today - rand(1..100)), commitment_period: "monthly", company_license: CompanyLicense.find_by(license: License.find_by(name: "Google Suite", license_type: "")), owner: User.all.sample},
]

puts "\nCreating license transactions..."
  license_transactions.each do |license_transaction|
    LicenseTransaction.create!(license_transaction)
  end

  puts "Adding expiry date to licenses"
  LicenseTransaction.all.each do |license_transaction|
    if license_transaction.commitment_period == "monthly"
      license_transaction.generate_expiry_date(30)
    elsif license_transaction.commitment_period == "yearly"
      license_transaction.generate_expiry_date(365)
    end
  end

puts "Finished creating license transactions"

puts "\nAdding active users to company licenses..."
CompanyLicense.all.each do |company_license|

  accumulated_licenses = 0

  company_license.license_transactions.each do |transaction|
    license_range = transaction.purchase_date..transaction.expiry_date
    if license_range === Date.today
      accumulated_licenses += transaction.user_licenses_purchased
    end
  end

  company_license.active_users = rand(0..accumulated_licenses)
  company_license.save!
end

puts "Finished adding active users to company licenses"
