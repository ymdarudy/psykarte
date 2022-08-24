require "rails_helper"

RSpec.describe Answer, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end

# validates :point, presence: true, numericality: { only_integer: true }

# scope :scoped_by_psychology_test, ->(params) {
#         where(question: Question.
#                 where(personality: Personality.
#                         where(psychology_test: params)))
#       }
# scope :scoped_by_personality, ->(params) {
#         where(question: Question.
#                 where(personality: params)).order(:id)
#       }
# scope :answered_times, -> { select(:point, :created_at).group_by { |record| record.created_at.strftime("%Y-%m-%d %H:%M") }.keys }
# scope :points_with_answered_times, -> { select(:point, :created_at).group_by { |record| record.created_at.strftime("%Y-%m-%d %H:%M") } }
