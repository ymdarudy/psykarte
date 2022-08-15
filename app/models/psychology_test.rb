class PsychologyTest < ApplicationRecord
  has_many :personalities
  has_many :supplementary_informations

  validates :title, presence: true, length: { maximum: 255 }
  validates :description, presence: true
  validates :referrer, presence: true
end
