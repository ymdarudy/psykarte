class Favorite < ApplicationRecord
  belongs_to :user
  belongs_to :psychology_test
end
