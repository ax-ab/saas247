class License < ApplicationRecord
  belongs_to :category
  belongs_to :vendor
end
