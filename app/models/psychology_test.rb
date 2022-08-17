class PsychologyTest < ApplicationRecord
  has_many :personalities, dependent: :destroy
  has_many :supplementary_informations, dependent: :destroy

  validates :title, presence: true, length: { maximum: 255 }
  validates :description, presence: true
  validates :referrer, presence: true
end
