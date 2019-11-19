class Company < ApplicationRecord
  has_many :users
  has_many :company_licenses
end
