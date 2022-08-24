FactoryBot.define do
  factory :question do
    title { "設問内容" }
    choice_min_point { 0 }
    choice_max_point { 4 }
    choice_min_word { "まったく当てはまらない" }
    choice_max_word { "完全に当てはまる" }
  end
end
