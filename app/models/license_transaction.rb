class LicenseTransaction < ApplicationRecord
  belongs_to :company_license
  belongs_to :owner, class_name: 'User'

  FAKE_EVENTS = [
    {
      "title": "Event 1",
      "start": "2019-11-05T09:00:00",
      "end": "2019-11-05T18:00:00"
    },
    {
      "title": "Event 2",
      "start": "2019-11-08",
      "end": "2019-11-10"
    },
    {
      "title": "Event 3",
      "start": "2019-12-08",
      "end": "2019-12-10"
    }
  ]

  def generate_expiry_date(days)
    self.expiry_date = purchase_date + days
    save
  end
end
