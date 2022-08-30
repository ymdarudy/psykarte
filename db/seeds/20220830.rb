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

#スマホ依存症
smartphone = PsychologyTest.create(
  title: "スマホ依存度診断",
  description: "スマホへの依存度を20問で検査します。",
  how_to_answer: "それぞれの質問ごとに、1（まったく当てはまらない）〜7（完全に当てはまる）で選択してください。",
  referrer: "重度のスマホ依存症（ノモフォビア）をチェックする20の質問",
  referrer_url: "https://yuchrszk.blogspot.com/2015/09/20.html",
  category_ids: [3],
)

no_mobile_phone_phobia = Personality.create(
  psychology_test: smartphone,
  name: "スマホ依存度",
  description: "点数が高いほど、スマホ依存度が高い。\n0〜27点：問題なし\n28〜55点：スマホ依存予備軍\n56〜83点：軽症\n84〜111点：重症\n112〜140点：完全な依存症",
  scoring_system: 1,
)

string_values = {
  "no_mobile_phone_phobia": no_mobile_phone_phobia,
}

CSV.foreach("db/csv/SmartPhoneQuestions.csv", headers: true) do |row|
  Question.create!(personality: string_values[row["personality"].intern],
                   title: row["title"],
                   choice_min_point: row["choice_min_point"],
                   choice_max_point: row["choice_max_point"],
                   choice_min_word: row["choice_min_word"],
                   choice_max_word: row["choice_max_word"],
                   point_reversal: row["point_reversal"])
end

#クリティカルシンキング
critical_thinking = PsychologyTest.create(
  title: "クリティカル・シンキング診断",
  description: "クリティカル・シンキングレベルを7問で検査します。",
  how_to_answer: "それぞれの質問ごとに、0（当てはまらない）,1（ときどき当てはまる）2（いつも当てはまる）で選択してください。\n※真ん中のチェックが「ときどき当てはまる」です。",
  referrer: "あなたの「クリティカル・シンキング」レベルを計る7つのチェック項目",
  referrer_url: "https://yuchrszk.blogspot.com/2020/11/7.html",
  category_ids: [4],
)

SupplementaryInformation.create([
  {
    psychology_test: critical_thinking,
    site_name: "【超図解】クリティカル・シンキングとは",
    site_url: "https://mba.globis.ac.jp/knowledge/detail-21114.html",
  },
  {
    psychology_test: critical_thinking,
    site_name: "【超思考法】天才を超える凡人になるための思考トレーニング【前編】",
    site_url: "https://daigoblog.jp/super-thinking/",
  },
])

c_t_level = Personality.create(
  psychology_test: critical_thinking,
  name: "クリティカル・シンキングレベル",
  description: "点数が高いほど、クリティカル・シンキングが出来ている。（最低0点、最高14点）\nクリティカル・シンキングが高いと...\n・バイアスにとらわれずにものごとを考えられる。\n・いろんな視点からものごとを考えられる。\n・いろんな証拠を集めて検討できる。",
  scoring_system: 1,
)

string_values = {
  "c_t_level": c_t_level,
}

CSV.foreach("db/csv/CriticalThinkingQuestions.csv", headers: true) do |row|
  Question.create!(personality: string_values[row["personality"].intern],
                   title: row["title"],
                   choice_min_point: row["choice_min_point"],
                   choice_max_point: row["choice_max_point"],
                   choice_min_word: row["choice_min_word"],
                   choice_max_word: row["choice_max_word"],
                   point_reversal: row["point_reversal"])
end

#自己効力感
