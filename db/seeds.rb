# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

admin_user = User.create(name: "山田", email: "test@email.com", password: "123123", admin: true)
normal_user = User.create(name: "田中", email: "test2@email.com", password: "123123")

short_big_five = PsychologyTest.create(
  title: "ショートビッグファイブ検査",
  description: "ビッグファイブ（外向性・協調性・誠実性・神経症傾向・開放性）を10問で検査します。",
  referrer: "3分で自分の性格を正しく理解する「ショートビッグファイブ検査」",
  referrer_url: "https://yuchrszk.blogspot.com/2017/06/sbf.html",
)

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

Question.create([
  { title: "私は、初めての人に会うのが好きで、会話をするのが好きで、人と会うのを楽しめる人間だ。",
    choice_min_point: 0,
    choice_max_point: 4,
    choice_min_word: "まったくあてはまらない",
    choice_max_word: "完全にあてはまる",
    point_reversal: false,
    personality: extroversion },
  { title: "私は、人に対して思いやりがあり、その思いやりを行動に移し、他人を差別しない人間だ。",
    choice_min_point: 0,
    choice_max_point: 4,
    choice_min_word: "まったくあてはまらない",
    choice_max_word: "完全にあてはまる",
    point_reversal: false,
    personality: coordination },
  { title: "私は、きっちりと物事をこなし、手際よく行動し、適切に物事を行おうとする人間だ。",
    choice_min_point: 0,
    choice_max_point: 4,
    choice_min_word: "まったくあてはまらない",
    choice_max_word: "完全にあてはまる",
    point_reversal: false,
    personality: honesty },
  { title: "私は、いつも心配事が多く、不安になりやすく、気分の浮き沈みが多い人間だ。",
    choice_min_point: 0,
    choice_max_point: 4,
    choice_min_word: "まったくあてはまらない",
    choice_max_word: "完全にあてはまる",
    point_reversal: false,
    personality: neuroticism },
  { title: "私は、知的な活動が得意で、創造性が高くて好奇心があり、新たなことを探求する人間だ。",
    choice_min_point: 0,
    choice_max_point: 4,
    choice_min_word: "まったくあてはまらない",
    choice_max_word: "完全にあてはまる",
    point_reversal: false,
    personality: openness },
  { title: "私は、恥ずかしがり屋で、物静かで、人が多いパーティなどは苦手な人間だ。",
    choice_min_point: 0,
    choice_max_point: 4,
    choice_min_word: "まったくあてはまらない",
    choice_max_word: "完全にあてはまる",
    point_reversal: true,
    personality: extroversion },
  { title: "私は、すぐ思ったことを口にし、冷淡な面があり、他人に同情を感じることはめったにない人間だ。",
    choice_min_point: 0,
    choice_max_point: 4,
    choice_min_word: "まったくあてはまらない",
    choice_max_word: "完全にあてはまる",
    point_reversal: true,
    personality: coordination },
  { title: "私は、あまり考えずに行動し、さほどきっちりは行動せず、ギリギリまで物事に手を付けない人間だ。",
    choice_min_point: 0,
    choice_max_point: 4,
    choice_min_word: "まったくあてはまらない",
    choice_max_word: "完全にあてはまる",
    point_reversal: true,
    personality: honesty },
  { title: "私は、たいていリラックスしており、落ち着きがあり、めったに問題について悩まない人間だ。",
    choice_min_point: 0,
    choice_max_point: 4,
    choice_min_word: "まったくあてはまらない",
    choice_max_word: "完全にあてはまる",
    point_reversal: true,
    personality: neuroticism },
  { title: "私は、物事を現実的に考え、伝統的な考え方を好み、めったに空想などで時間を浪費しない人間だ。",
    choice_min_point: 0,
    choice_max_point: 4,
    choice_min_word: "まったくあてはまらない",
    choice_max_word: "完全にあてはまる",
    point_reversal: true,
    personality: openness },
])
