class String
  # colorization
  def colorize(color_code)
    "\e[#{color_code}m#{self}\e[0m"
  end

  def green
    colorize(32)
  end
end

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
puts "\nCreating companies..."
  companies = [
    {name: "Company"},
  ]

  companies.each do |company|
    Company.create!(company)
  end
puts "Finished creating companies"

puts "\nCreating users..."
  users = [
    {email: "user@company.com", password: "123456", department: "IT", company: Company.find_by(name: "Company")},
    {email: "user2@company.com", password: "123456", department: "Sales", company: Company.find_by(name: "Company")},
    {email: "user3@company.com", password: "123456", department: "Marketing", company: Company.find_by(name: "Company")},
    {email: "user4@company.com", password: "123456", department: "HR", company: Company.find_by(name: "Company")},
    {email: "user5@company.com", password: "123456", department: "Finance", company: Company.find_by(name: "Company")}
  ]

  users.each do |user|
    User.create!(user)
  end
puts "Finished creating users"

puts "\nCreating vendors..."
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

  vendors.each do |vendor|
    Vendor.create!(vendor)
  end
puts "Finished creating vendors"

puts "\nCreating categories..."
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

  categories.each do |category|
    Category.create!(category)
  end
puts "Finished creating categories"

puts "\nCreating licenses..."
  licenses = [
    {name: "Slack", license_type: "", category: Category.find_by(name: "Communications"),
      vendor: Vendor.find_by(name: "Slack"), logo_url: "vendor-logos/slack-logo.svg", avg_license_cost: 6.875 },
    {name: "Microsoft Office 365", license_type: "Business Essentials", category: Category.find_by(name: "Business Operations"),
      vendor: Vendor.find_by(name: "Microsoft"), logo_url: "vendor-logos/msft-office-365-logo.svg", avg_license_cost: 7.915 },
    {name: "Microsoft Office 365", license_type: "Business Premium", category: Category.find_by(name: "Business Operations"),
      vendor: Vendor.find_by(name: "Microsoft"), logo_url: "vendor-logos/msft-office-365-logo.svg", avg_license_cost: 7.915 },
    {name: "Dropbox", license_type: "Standard", category: Category.find_by(name: "Utilities"),
      vendor: Vendor.find_by(name: "Dropbox"), logo_url: "vendor-logos/dropbox-logo.svg", avg_license_cost: 13.75 },
    {name: "Dropbox", license_type: "Advanced", category: Category.find_by(name: "Utilities"),
      vendor: Vendor.find_by(name: "Dropbox"), logo_url: "vendor-logos/dropbox-logo.svg", avg_license_cost: 13.75 },
    {name: "Zendesk", license_type: "Enterprise", category: Category.find_by(name: "Customer Support"),
      vendor: Vendor.find_by(name: "Zendesk"), logo_url: "vendor-logos/zendesk-logo.svg", avg_license_cost: 107.495 },
    {name: "Zendesk", license_type: "Professional", category: Category.find_by(name: "Customer Support"),
      vendor: Vendor.find_by(name: "Zendesk"), logo_url: "vendor-logos/zendesk-logo.svg", avg_license_cost: 107.495 },
    {name: "JiRA", license_type: "Standard", category: Category.find_by(name: "Engineering"),
      vendor: Vendor.find_by(name: "Atlassian"), logo_url: "vendor-logos/Jira-logo.svg", avg_license_cost: 6.31 },
    {name: "Salesforce", license_type: "Small Business - Sales Professional", category: Category.find_by(name: "Sales"),
      vendor: Vendor.find_by(name: "Salesforce"), logo_url: "vendor-logos/salesforce-logo.svg", avg_license_cost: 67.75 },
    {name: "Google Suite", license_type: "", category: Category.find_by(name: "Business Operations"),
      vendor: Vendor.find_by(name: "Google"), logo_url: "vendor-logos/gsuite-logo.svg", avg_license_cost: 5.2 },
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

  licenses.each do |license|
    License.create!(license)
  end
puts "Finished creating licenses"

puts "\nCreating company licenses..."
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

  company_licenses.each do |company_license|
    CompanyLicense.create!(company_license)
  end
puts "Finished creating company licenses"

puts "\nCreating initial license transactions..."
  def get_company_license(license_name, license_type)
    CompanyLicense.find_by(license: License.find_by(name: license_name, license_type: license_type))
  end

  license_transactions = [
    {user_licenses_purchased: 200, total_purchase_price: (6.25*200*12),commitment_period: "yearly",
      company_license: get_company_license("Slack", ""), owner: User.all.sample},
    {user_licenses_purchased: 150, total_purchase_price: (7.5*150),commitment_period: "monthly",
      company_license: get_company_license("Slack", ""), owner: User.all.sample},
    {user_licenses_purchased: 500, total_purchase_price: (4.9*500*12),commitment_period: "yearly",
      company_license: get_company_license("Microsoft Office 365", "Business Essentials"), owner: User.all.sample},
    {user_licenses_purchased: 300, total_purchase_price: (10.93*300*12),commitment_period: "yearly",
      company_license: get_company_license("Microsoft Office 365", "Business Premium"), owner: User.all.sample},
    {user_licenses_purchased: 150, total_purchase_price: (12*150),commitment_period: "monthly",
      company_license: get_company_license("Dropbox", "Standard"), owner: User.all.sample},
    {user_licenses_purchased: 100, total_purchase_price: (15*100*12),commitment_period: "yearly",
      company_license: get_company_license("Dropbox", "Advanced"), owner: User.all.sample},
    {user_licenses_purchased: 10, total_purchase_price: (134.6*10),commitment_period: "monthly",
      company_license: get_company_license("Zendesk", "Enterprise"), owner: User.all.sample},
    {user_licenses_purchased: 15, total_purchase_price: (80.39*15),commitment_period: "monthly",
      company_license: get_company_license("Zendesk", "Professional"), owner: User.all.sample},
    {user_licenses_purchased: 100, total_purchase_price: (6.31*100*12),commitment_period: "yearly",
      company_license: get_company_license("JiRA", "Standard"), owner: User.all.sample},
    {user_licenses_purchased: 100, total_purchase_price: (67.75*100*12),commitment_period: "yearly",
      company_license: get_company_license("Salesforce", "Small Business - Sales Professional"), owner: User.all.sample},
    {user_licenses_purchased: 150, total_purchase_price: (5.2*150),commitment_period: "monthly",
      company_license: get_company_license("Google Suite", ""), owner: User.all.sample},
    ]

  license_transactions.each do |license_transaction|
    LicenseTransaction.create!(license_transaction)
  end

  puts "Adding expiry and purchase date to initial licenses..."
    LicenseTransaction.all.each do |license_transaction|
      license_transaction.add_purchase_date(license_transaction.commitment_period)
      license_transaction.add_expiry_date(license_transaction.commitment_period)
      license_transaction.add_owner
    end
puts "Finished creating initial license transactions"

puts "\nAdvancing initial transactions to current or future date..."
  def transaction_updated(transaction)
    # -2 below so that there are no purchase_dates on today's date
    future_date = transaction.expiry_date > Date.today - 2
  end

  def recusively_update_transaction(transaction)
    # printf "%-60s %s", "\n#{transaction.company_license.license.name} #{transaction.company_license.license.license_type} (#{transaction.commitment_period})", "#{transaction.expiry_date}"

    next_transaction = {
      user_licenses_purchased: transaction.user_licenses_purchased,
      total_purchase_price: transaction.total_purchase_price,
      purchase_date: transaction.expiry_date + 1,
      commitment_period: transaction.commitment_period,
      company_license: transaction.company_license,
      owner: transaction.owner
    }

    LicenseTransaction.create!(next_transaction)
    last_transaction = LicenseTransaction.last
    last_transaction.add_expiry_date(last_transaction.commitment_period)

    # print " => #{last_transaction.expiry_date}".green

    recusively_update_transaction(last_transaction) if !transaction_updated(last_transaction)
  end

  LicenseTransaction.all.each do |transaction|
    if !transaction_updated(transaction)
      recusively_update_transaction(transaction)
    end
  end
puts "Finished advancing initial transactions to current or future date"

puts "\nCreating custom license transactions..."
  50.times do
    LicenseTransaction.create!(license_transactions.sample)
    last_transaction = LicenseTransaction.last
    last_transaction.add_purchase_date(last_transaction.commitment_period)
    last_transaction.add_expiry_date(last_transaction.commitment_period)
    last_transaction.add_owner
  end
puts "Finished creating custom license transactions"

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

puts "\n"
