class Question < ApplicationRecord
  belongs_to :personality
  has_many :answers, dependent: :destroy

  validates :title, presence: true
  validates :choice_min_point, presence: true, numericality: { only_integer: true }
  validates :choice_max_point, presence: true, numericality: { only_integer: true }
  validates :choice_min_word, presence: true, length: { maximum: 30 }
  validates :choice_max_word, presence: true, length: { maximum: 30 }
  validates :point_reversal, inclusion: [true, false]

  scope :scoped_by_test, ->(p_test) do
          where(personality: Personality.where(psychology_test: p_test))
        end
end
