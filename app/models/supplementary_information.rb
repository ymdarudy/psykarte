class SupplementaryInformation < ApplicationRecord
  belongs_to :psychology_test

  validates :site_name, presence: true
  validates :site_url, presence: true, format: /\A#{URI::regexp(%w(http https))}\z/
end
