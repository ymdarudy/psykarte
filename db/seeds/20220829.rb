# PPR
Category.create(id: 6, name: "恋愛")

ppr = PsychologyTest.create(
  title: "PPR（パートナー応答性知覚）診断",
  description: "パートナーの応答性（反応の良さ）を16問で検査します。",
  how_to_answer: "あなたの身近なパートナーを思い浮かべつつ、それぞれの項目に、0（まったく当てはまらない）〜5(完全に当てはまる)の範囲で採点してください。\n各項目の前にある「◯◯」には、パートナーの名前を入れましょう。",
  referrer: "満足度が高いカップルに共通する最大の要素「PPR」をチェックする16問",
  referrer_url: "https://yuchrszk.blogspot.com/2021/06/ppr16.html",
  category_ids: [6],
)

responsiveness = Personality.create(
  psychology_test: ppr,
  name: "応答性",
  description: "点数が高いほど、ちゃんとこちらの話を聞いてくれている（調査平均: 3.5）",
  scoring_system: 2,
)

insensitivity = Personality.create(
  psychology_test: ppr,
  name: "鈍感性",
  description: "点数が高いほど、こちらの感情に鈍感である（＝点数が低いほど敏感）（調査平均: 1.0）",
  scoring_system: 2,
)

string_values = {
  "responsiveness": responsiveness,
  "insensitivity": insensitivity,
}

CSV.foreach("db/csv/PPRQuestions.csv", headers: true) do |row|
  Question.create!(personality: string_values[row["personality"].intern],
                   title: row["title"],
                   choice_min_point: row["choice_min_point"],
                   choice_max_point: row["choice_max_point"],
                   choice_min_word: row["choice_min_word"],
                   choice_max_word: row["choice_max_word"],
                   point_reversal: row["point_reversal"])
end
