class PsychologyTest < ApplicationRecord
  has_many :personalities, dependent: :destroy
  has_many :supplementary_informations, dependent: :destroy
  has_many :favorites, dependent: :destroy
  has_many :favorited_users, through: :favorites, source: :user
  has_many :tests_categories, dependent: :destroy
  has_many :categories, through: :tests_categories

  validates :title, presence: true, length: { maximum: 255 }
  validates :description, presence: true
  validates :referrer, presence: true

  scope :scoped_by_user, ->(params) {
      where(personalities: Personality.
              where(questions: Question.
                      where(answers: params.answers)))
    }
end
