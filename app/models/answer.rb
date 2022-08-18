class Answer < ApplicationRecord
  belongs_to :question
  belongs_to :user

  validates :point, presence: true, numericality: { only_integer: true }
end
