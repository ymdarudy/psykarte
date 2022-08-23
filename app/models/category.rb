class Category < ApplicationRecord
  has_many :tests_categories, dependent: :destroy
  has_many :tests, through: :tests_categories, source: :psychology_test

  validates :name, presence: true
end
