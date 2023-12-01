# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# 質問と選択肢のデータ
questions_data = [
  {
    content: "ようこそ",
    choices: [
      { content: "maeva", correct: true },
      { content: "'ia ora na", correct: false },
    ],
  },
  {
    content: "雨",
    choices: [
      { content: "hiona", correct: false },
      { content: "ua", correct: true },
    ],
  },
  {
    content: "風",
    choices: [
      { content: "mata'i", correct: true },
      { content: "mou'a", correct: false },
    ],
  },
  {
    content: "ありがとう",
    choices: [
      { content: "nana", correct: false },
      { content: "maururu", correct: true },
    ],
  },
  {
    content: "さよなら",
    choices: [
      { content: "nana", correct: true },
      { content: "'ia ora na", correct: false },
    ],
  },
  {
    content: "おはよう",
    choices: [
      { content: "maururu", correct: false },
      { content: "'ia ora na", correct: true },
    ],
  },
  {
    content: "男性",
    choices: [
      { content: "tane", correct: true },
      { content: "vahine", correct: false },
    ],
  },
  {
    content: "女性",
    choices: [
      { content: "tane", correct: false },
      { content: "vahine", correct: true },
    ],
  },
  {
    content: "美しい",
    choices: [
      { content: "nehenehe", correct: true },
      { content: "maita'i", correct: false },
    ],
  },
  {
    content: "空",
    choices: [
      { content: "miti", correct: false },
      { content: "ra'i", correct: true },
    ],
  },
  {
    content: "海",
    choices: [
      { content: "miti", correct: true },
      { content: "ra'i", correct: false },
    ],
  },
  {
    content: "花",
    choices: [
      { content: "moana", correct: false },
      { content: "tiare", correct: true },
    ],
  },
  {
    content: "歌",
    choices: [
      { content: "himene", correct: true },
      { content: "pahu", correct: false },
    ],
  },
  {
    content: "伝統舞踊",
    choices: [
      { content: "tamure", correct: false },
      { content: "ori", correct: true },
    ],
  },

  {
    content: "島",
    choices: [
      { content: "motu", correct: true },
      { content: "mou'a", correct: false },
    ],
  },
  {
    content: "山",
    choices: [
      { content: "anapape", correct: false },
      { content: "mou'a", correct: true },
    ],
  },
  {
    content: "川",
    choices: [
      { content: "anapape", correct: true },
      { content: "miti", correct: false },
    ],
  },
  {
    content: "水",
    choices: [
      { content: "mahana", correct: false },
      { content: "pape", correct: true },
    ],
  },
  {
    content: "がんばれ！",
    choices: [
      { content: "manuia!", correct: true },
      { content: "haere mai!", correct: false },
    ],
  },
  {
    content: "大きい",
    choices: [
      { content: "iti", correct: false },
      { content: "nui", correct: true },
    ],
  },
  {
    content: "小さい",
    choices: [
      { content: "iti", correct: true },
      { content: "nui", correct: false },
    ],
  },
  {
    content: "暖かい",
    choices: [
      { content: "to'eto'e", correct: false },
      { content: "mahanahana", correct: true },
    ],
  },
  {
    content: "寒い",
    choices: [
      { content: "to'eto'e", correct: true },
      { content: "mahanahana", correct: false },
    ],
  },
  {
    content: "太陽",
    choices: [
      { content: "'ava'e", correct: false },
      { content: "mahana", correct: true },
    ],
  },
  {
    content: "赤色",
    choices: [
      { content: "uteute", correct: true },
      { content: "ninamu", correct: false },
    ],
  },
  {
    content: "黒色",
    choices: [
      { content: "matie", correct: false },
      { content: "'ere'ere", correct: true },
    ],
  },
  {
    content: "白色",
    choices: [
      { content: "'uo'uo", correct: true },
      { content: "'ere'ere", correct: false },
    ],
  },
  {
    content: "灰色",
    choices: [
      { content: "tarona", correct: false },
      { content: "'ohina", correct: true },
    ],
  },
  {
    content: "桃色",
    choices: [
      { content: "tarona", correct: true },
      { content: "'uo'uo", correct: false },
    ],
  },
  {
    content: "緑色",
    choices: [
      { content: "'o'aha", correct: false },
      { content: "matie", correct: true },
    ],
  },
  {
    content: "茶色",
    choices: [
      { content: "'o'aha", correct: true },
      { content: "ninamu", correct: false },
    ],
  },
  {
    content: "青色",
    choices: [
      { content: "uteute", correct: false },
      { content: "ninamu", correct: true },
    ],
  },
  {
    content: "月曜日",
    choices: [
      { content: "Monire", correct: true },
      { content: "Mahana Piti", correct: false },
    ],
  },
  {
    content: "火曜日",
    choices: [
      { content: "Mahana Toru", correct: false },
      { content: "Mahana Piti", correct: true },
    ],
  },
  {
    content: "水曜日",
    choices: [
      { content: "Mahana Toru", correct: true },
      { content: "Mahana Maha", correct: false },
    ],
  },
  {
    content: "木曜日",
    choices: [
      { content: "Mahana Pae", correct: false },
      { content: "Mahana Maha", correct: true },
    ],
  },
  {
    content: "金曜日",
    choices: [
      { content: "Mahana Pae", correct: true },
      { content: "Mahana Ma'a", correct: false },
    ],
  },
  {
    content: "土曜日",
    choices: [
      { content: "Tapati", correct: false },
      { content: "Mahana Ma'a", correct: true },
    ],
  },
  {
    content: "日曜日",
    choices: [
      { content: "Tapati", correct: true },
      { content: "Monire", correct: false },
    ],
  },
  {
    content: "彫刻",
    choices: [
      { content: "marae", correct: false },
      { content: "tiki", correct: true },
    ],
  },
  {
    content: "行く",
    choices: [
      { content: "haere", correct: true },
      { content: "'au", correct: false },
    ],
  },
  {
    content: "泳ぐ",
    choices: [
      { content: "ho'i", correct: false },
      { content: "'au", correct: true },
    ],
  },
  {
    content: "帰る",
    choices: [
      { content: "ho'i", correct: true },
      { content: "ho'o mai", correct: false },
    ],
  },
  {
    content: "買う",
    choices: [
      { content: "ha'uti", correct: false },
      { content: "ho'o mai", correct: true },
    ],
  },
  {
    content: "遊ぶ",
    choices: [
      { content: "ha'uti", correct: true },
      { content: "haere 'avae", correct: false },
    ],
  },
  {
    content: "歩く",
    choices: [
      { content: "ho'o atu", correct: false },
      { content: "haere 'avae", correct: true },
    ],
  },
  {
    content: "売る",
    choices: [
      { content: "ho'o atu", correct: true },
      { content: "fa'ahoro", correct: false },
    ],
  },
  {
    content: "運転する",
    choices: [
      { content: "hapono", correct: false },
      { content: "fa'ahoro", correct: true },
    ],
  },
  {
    content: "送る",
    choices: [
      { content: "hapono", correct: true },
      { content: "pou", correct: false },
    ],
  },
  {
    content: "降りる",
    choices: [
      { content: "papa'i", correct: false },
      { content: "pou", correct: true },
    ],
  },
  {
    content: "書く",
    choices: [
      { content: "papa'i", correct: true },
      { content: "hohoni", correct: false },
    ],
  },
  {
    content: "噛む",
    choices: [
      { content: "feruri", correct: false },
      { content: "hohoni", correct: true },
    ],
  },
  {
    content: "考える",
    choices: [
      { content: "feruri", correct: true },
      { content: "manava", correct: false },
    ],
  },
  {
    content: "歓迎する",
    choices: [
      { content: "ha'apeu", correct: false },
      { content: "manava", correct: true },
    ],
  },
  {
    content: "気取っている",
    choices: [
      { content: "ha'apeu", correct: true },
      { content: "'o'omo", correct: false },
    ],
  },
  {
    content: "着る",
    choices: [
      { content: "haere mai", correct: false },
      { content: "'o'omo", correct: true },
    ],
  },
  {
    content: "来る",
    choices: [
      { content: "haere mai", correct: true },
      { content: "hoe", correct: false },
    ],
  },
  {
    content: "漕ぐ",
    choices: [
      { content: "'avau", correct: false },
      { content: "hoe", correct: true },
    ],
  },
  {
    content: "叱る",
    choices: [
      { content: "'avau", correct: true },
      { content: "ite", correct: false },
    ],
  },
  {
    content: "知る",
    choices: [
      { content: "fa'arue", correct: false },
      { content: "ite", correct: true },
    ],
  },
  {
    content: "捨てる",
    choices: [
      { content: "fa'arue", correct: true },
      { content: "parahi", correct: false },
    ],
  },
  {
    content: "座る",
    choices: [
      { content: "ti'a", correct: false },
      { content: "parahi", correct: true },
    ],
  },
  {
    content: "立つ",
    choices: [
      { content: "ti'a", correct: true },
      { content: "amu", correct: false },
    ],
  },
  {
    content: "食べる",
    choices: [
      { content: "tai'a", correct: false },
      { content: "amu", correct: true },
    ],
  },
  {
    content: "釣りをする",
    choices: [
      { content: "tai'a", correct: true },
      { content: "haapao", correct: false },
    ],
  },
  {
    content: "注意する",
    choices: [
      { content: "ta'oto", correct: false },
      { content: "haapao", correct: true },
    ],
  },
  {
    content: "寝る",
    choices: [
      { content: "ta'oto", correct: true },
      { content: "inu", correct: false },
    ],
  },
  {
    content: "飲む",
    choices: [
      { content: "pa'uma", correct: false },
      { content: "inu", correct: true },
    ],
  },
  {
    content: "乗る",
    choices: [
      { content: "pa'uma", correct: true },
      { content: "horo", correct: false },
    ],
  },
  {
    content: "走る",
    choices: [
      { content: "parau", correct: false },
      { content: "horo", correct: true },
    ],
  },
  {
    content: "話す",
    choices: [
      { content: "parau", correct: true },
      { content: "e rave mai", correct: false },
    ],
  },
  {
    content: "拾う",
    choices: [
      { content: "ha'api'i", correct: false },
      { content: "e rave mai", correct: true },
    ],
  },
  {
    content: "勉強する",
    choices: [
      { content: "ha'api'i", correct: true },
      { content: "hi'o", correct: false },
    ],
  },
  {
    content: "見る",
    choices: [
      { content: "pi'i", correct: false },
      { content: "hi'o", correct: true },
    ],
  },
  {
    content: "呼ぶ",
    choices: [
      { content: "pi'i", correct: true },
      { content: "tai'o", correct: false },
    ],
  },
  {
    content: "読む",
    choices: [
      { content: "tunu", correct: false },
      { content: "tai'o", correct: true },
    ],
  },
  {
    content: "料理する",
    choices: [
      { content: "tunu", correct: true },
      { content: "haere", correct: false },
    ],
  },
  {
    content: "行きましょう！",
    choices: [
      { content: "Ha'aviti!", correct: false },
      { content: "Haere tatou!", correct: true },
    ],
  },
  {
    content: "急ぎなさい!",
    choices: [
      { content: "Ha'aviti!", correct: true },
      { content: "A fa'aoro mai!", correct: false },
    ],
  },
  {
    content: "我慢して下さい！",
    choices: [
      { content: "Maniania!", correct: false },
      { content: "A fa'aoro mai!", correct: true },
    ],
  },
  {
    content: "静かにしなさい！",
    choices: [
      { content: "Maniania!", correct: true },
      { content: "A hi'o na!", correct: false },
    ],
  },
  {
    content: "見てごらん！",
    choices: [
      { content: "Mamu!", correct: false },
      { content: "A hi'o na!", correct: true },
    ],
  },
  {
    content: "家",
    choices: [
      { content: "fare", correct: true },
      { content: "tumu ra'au", correct: false },
    ],
  },
  {
    content: "木",
    choices: [
      { content: "mata", correct: false },
      { content: "tumu ra'au", correct: true },
    ],
  },
  {
    content: "顔",
    choices: [
      { content: "mata", correct: true },
      { content: "tino", correct: false },
    ],
  },
  {
    content: "体",
    choices: [
      { content: "upo'o", correct: false },
      { content: "tino", correct: true },
    ],
  },
  {
    content: "頭",
    choices: [
      { content: "upo'o", correct: true },
      { content: "rima", correct: false },
    ],
  },
  {
    content: "手",
    choices: [
      { content: "ohu're", correct: false },
      { content: "rima", correct: true },
    ],
  },
  {
    content: "尻",
    choices: [
      { content: "ohu're", correct: true },
      { content: "'avae", correct: false },
    ],
  },
  {
    content: "すね",
    choices: [
      { content: "tua", correct: false },
      { content: "'avae", correct: true },
    ],
  },
  {
    content: "背中",
    choices: [
      { content: "tua", correct: true },
      { content: "toto", correct: false },
    ],
  },
  {
    content: "血",
    choices: [
      { content: "arapo'a", correct: false },
      { content: "toto", correct: true },
    ],
  },
  {
    content: "喉",
    choices: [
      { content: "arapo'a", correct: true },
      { content: "mahaha", correct: false },
    ],
  },
  {
    content: "肺",
    choices: [
      { content: "inu", correct: false },
      { content: "mahaha", correct: true },
    ],
  },
  {
    content: "鼻",
    choices: [
      { content: "inu", correct: true },
      { content: "'opu", correct: false },
    ],
  },
  {
    content: "腹",
    choices: [
      { content: "turi", correct: false },
      { content: "'opu", correct: true },
    ],
  },
  {
    content: "嬉しい",
    choices: [
      { content: "oaoa", correct: true },
      { content: "anaana", correct: false },
    ],
  },
  {
    content: "輝く",
    choices: [
      { content: "poiri", correct: false },
      { content: "anaana", correct: true },
    ],
  },
  {
    content: "暗い",
    choices: [
      { content: "poiri", correct: true },
      { content: "haumaru", correct: false },
    ],
  },
  {
    content: "涼しい",
    choices: [
      { content: "noanoa", correct: false },
      { content: "haumaru", correct: true },
    ],
  },
  {
    content: "香りの良い",
    choices: [
      { content: "noanoa", correct: true },
      { content: "onaona", correct: false },
    ],
  },
  {
    content: "辛い",
    choices: [
      { content: "oaoa", correct: false },
      { content: "onaona", correct: true },
    ],
  },
]

# 質問と選択肢を作成
questions_data.each do |data|
  question = Question.create(content: data[:content])
  question.choices.create(data[:choices])
end