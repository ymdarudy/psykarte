# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require "csv"

# User
admin_user = User.create(name: "山田", email: "test@email.com", password: "123123", avatar: File.open("./app/assets/images/yamada.webp"), admin: true)
normal_user = User.create(name: "青野", email: "test2@email.com", password: "123123")
User.create([
  { name: "遠藤", email: "test3@email.com", password: "123123" },
  { name: "門脇", email: "test4@email.com", password: "123123" },
  { name: "金子", email: "test5@email.com", password: "123123" },
  { name: "齋藤", email: "test6@email.com", password: "123123" },
  { name: "佐藤", email: "test7@email.com", password: "123123" },
  { name: "鈴木", email: "test8@email.com", password: "123123" },
  { name: "中村", email: "test9@email.com", password: "123123" },
  { name: "西川", email: "test10@email.com", password: "123123" },
  { name: "丸岡", email: "test11@email.com", password: "123123" },
  { name: "森塚", email: "test12@email.com", password: "123123" },
  { name: "吉田", email: "test13@email.com", password: "123123" },
])

# Category
Category.create([
  { id: 1, name: "ビッグファイブ" },
  { id: 2, name: "ユーモア" },
  { id: 3, name: "依存症" },
  { id: 4, name: "思考法" },
  { id: 5, name: "自己効力感" },
])

# ビッグファイブ
short_big_five = PsychologyTest.create(
  title: "ショートビッグファイブ診断",
  description: "ビッグファイブ（外向性・協調性・誠実性・神経症傾向・開放性）を10問で検査します。",
  how_to_answer: "以下の10個の質問に直感でお答えください。\nそれぞれに対し、0（まったくあてはまらない）〜4（完全にあてはまる）の5段階で点数をつけてください。",
  referrer: "3分で自分の性格を正しく理解する「ショートビッグファイブ検査」",
  referrer_url: "https://yuchrszk.blogspot.com/2017/06/sbf.html",
  category_ids: [1],
)

SupplementaryInformation.create([
  {
    psychology_test: short_big_five,
    site_name: "自分の性格が最も正確にわかる10の質問",
    site_url: "https://daigoblog.jp/shortbig5/",
  },
  {
    psychology_test: short_big_five,
    site_name: "『嘘』を見抜いて自己分析！|ビッグファイブ性格診断【BIG5-BASIC】",
    site_url: "https://big5-basic.com/front/index.php?route=common/home",
  },
])

extroversion = Personality.create(
  psychology_test: short_big_five,
  name: "外向性",
  description: "点数が高いほど社交的（最低0点、最高8点）",
  scoring_system: 1,
)

coordination = Personality.create(
  psychology_test: short_big_five,
  name: "協調性",
  description: "点数が高いほどやさしい（最低0点、最高8点）",
  scoring_system: 1,
)

honesty = Personality.create(
  psychology_test: short_big_five,
  name: "誠実性",
  description: "点数が高いほどまじめ（最低0点、最高8点）",
  scoring_system: 1,
)

neuroticism = Personality.create(
  psychology_test: short_big_five,
  name: "神経症傾向",
  description: "点数が高いほど不安になったり緊張しがち（最低0点、最高8点）",
  scoring_system: 1,
)

openness = Personality.create(
  psychology_test: short_big_five,
  name: "開放性",
  description: "点数が高いほど知的好奇心が高い（最低0点、最高8点）",
  scoring_system: 1,
)

[
  ["私は、初めての人に会うのが好きで、会話をするのが好きで、人と会うのを楽しめる人間だ。", extroversion],
  ["私は、人に対して思いやりがあり、その思いやりを行動に移し、他人を差別しない人間だ。", coordination],
  ["私は、きっちりと物事をこなし、手際よく行動し、適切に物事を行おうとする人間だ。", honesty],
  ["私は、いつも心配事が多く、不安になりやすく、気分の浮き沈みが多い人間だ。", neuroticism],
  ["私は、知的な活動が得意で、創造性が高くて好奇心があり、新たなことを探求する人間だ。", openness],
  ["私は、恥ずかしがり屋で、物静かで、人が多いパーティなどは苦手な人間だ。", extroversion, true],
  ["私は、すぐ思ったことを口にし、冷淡な面があり、他人に同情を感じることはめったにない人間だ。", coordination, true],
  ["私は、あまり考えずに行動し、さほどきっちりは行動せず、ギリギリまで物事に手を付けない人間だ。", honesty, true],
  ["私は、たいていリラックスしており、落ち着きがあり、めったに問題について悩まない人間だ。", neuroticism, true],
  ["私は、物事を現実的に考え、伝統的な考え方を好み、めったに空想などで時間を浪費しない人間だ。", openness, true],
].each do |title, personality, point_reversal = false|
  Question.create(
    title: title,
    personality: personality,
    point_reversal: point_reversal,
    choice_min_point: 0,
    choice_max_point: 4,
    choice_min_word: "まったくあてはまらない",
    choice_max_word: "完全にあてはまる",
  )
end

# ユーモアスタイル
humor_style = PsychologyTest.create(
  title: "ユーモアスタイル診断",
  description: "あなたのユーモアスタイル（親和的・自己高揚的・攻撃的・自己卑下的）を32問で検査します。",
  how_to_answer: "以下のすべての質問に1点（まったく当てはまらない）〜7点（完全に当てはまる）の範囲でお答えください。",
  referrer: "自分のユーモアスタイルを判断する32問",
  referrer_url: "https://yuchrszk.blogspot.com/2017/08/32.html",
  category_ids: [2],
)

SupplementaryInformation.create([
  {
    psychology_test: humor_style,
    site_name: "人生の幸福度を左右する４つの「ユーモアスタイル」",
    site_url: "https://yuchrszk.blogspot.com/2017/08/humorsyles.html",
  },
])

friendly = Personality.create(
  psychology_test: humor_style,
  name: "親和的",
  description: "点数が高いほど親和的ユーモア度が高い（調査平均: 男性47.3 / 女性46.0）",
  scoring_system: 1,
)

proud_of_himself = Personality.create(
  psychology_test: humor_style,
  name: "自己高揚的",
  description: "点数が高いほど自己高揚的ユーモア度が高い（調査平均: 男性37.9 / 女性36.8）",
  scoring_system: 1,
)

aggressive = Personality.create(
  psychology_test: humor_style,
  name: "攻撃的",
  description: "点数が高いほど攻撃的ユーモア度が高い（調査平均: 男性32.3 / 女性26.3）",
  scoring_system: 1,
)

self_deprecating = Personality.create(
  psychology_test: humor_style,
  name: "自己卑下的",
  description: "点数が高いほど自己卑下的ユーモア度が高い（調査平均: 男性27.8 / 女性24.5）",
  scoring_system: 1,
)

string_values = {
  "friendly": friendly,
  "proud_of_himself": proud_of_himself,
  "aggressive": aggressive,
  "self_deprecating": self_deprecating,
}

CSV.foreach("db/csv/HumorStyleQuestions.csv", headers: true) do |row|
  Question.create!(personality: string_values[row["personality"].intern],
                   title: row["title"],
                   choice_min_point: row["choice_min_point"],
                   choice_max_point: row["choice_max_point"],
                   choice_min_word: row["choice_min_word"],
                   choice_max_word: row["choice_max_word"],
                   point_reversal: row["point_reversal"])
end

CSV.foreach("db/csv/HumorStyleAnswers.csv", headers: true) do |row|
  Answer.create!(user_id: 1,
                 question_id: row["question_id"],
                 point: row["point"])
end
