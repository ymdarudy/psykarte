class Answer < ApplicationRecord
  belongs_to :question
  belongs_to :user

  validates :point, presence: true, numericality: { only_integer: true }

  scope :scoped_by_psychology_test, ->(p_test) {
          where(question: Question.
                  where(personality: Personality.
                          where(psychology_test: p_test)))
        }
  scope :scoped_by_personality, ->(personality) {
          where(question: Question.
                  where(personality: personality))
        }
  scope :answered_times, -> { select(:point, :created_at).group_by { |record| record.created_at.strftime("%Y-%m-%d %H:%M") }.keys }

  scope :points_with_answered_times, -> { select(:point, :created_at).group_by { |record| record.created_at.strftime("%Y-%m-%d %H:%M") } }
end
