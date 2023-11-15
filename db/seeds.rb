# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

10.times do |i|
  question = Question.create(content: "問題#{i + 1}")

  # 選択肢を生成
  choices = [
    { content: "選択肢1 for 問題#{i + 1}", correct: true },
    { content: "選択肢2 for 問題#{i + 1}", correct: false },
  ]

  # 選択肢を一括で作成
  question.choices.create(choices)
end
