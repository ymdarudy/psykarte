require "rails_helper"

RSpec.describe Question, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end

# validates :title, presence: true
# validates :choice_min_point, presence: true, numericality: { only_integer: true }
# validates :choice_max_point, presence: true, numericality: { only_integer: true }
# validates :choice_min_word, presence: true, length: { maximum: 30 }
# validates :choice_max_word, presence: true, length: { maximum: 30 }
# validates :point_reversal, inclusion: [true, false]

# scope :scoped_by_test, ->(params) {
#     where(personality: Personality.where(psychology_test: params))
#   }
