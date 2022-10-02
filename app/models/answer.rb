class Answer < ApplicationRecord
  belongs_to :question
  belongs_to :user

  validates :point, presence: true, numericality: { only_integer: true }

  scope :scoped_by_psychology_test, ->(p_test) do
          where(question: Question.
                  where(personality: Personality.
                          where(psychology_test: p_test)))
        end

  scope :scoped_by_personality, ->(personality) do
          where(question: Question.
                  where(personality: personality))
        end

  scope :answered_times, -> do
          select(:point, :created_at).group_by { |record| record.created_at.strftime("%Y-%m-%d %H:%M") }.keys
        end

  scope :points_with_answered_times, -> do
          select(:point, :created_at).group_by { |record| record.created_at.strftime("%Y-%m-%d %H:%M") }
        end
end
