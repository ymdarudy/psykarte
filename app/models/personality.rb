class Personality < ApplicationRecord
  belongs_to :psychology_test
  has_many :questions

  validates :name, presence: true, length: { maximum: 30 }
  validates :description, presence: true
  validates :scoring_system, presence: true, numericality: { only_integer: true }
end
