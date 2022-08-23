class TestsCategory < ApplicationRecord
  belongs_to :psychology_test
  belongs_to :category
end
