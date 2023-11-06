# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# 問題と選択肢を生成
10.times do |i|
  question = Question.create(content: "問題#{i + 1}")

  # 問題に対する選択肢を作成
  2.times do |j|
    correct = (j == 0)  # 最初の選択肢を正解にする
    question.choices.create(content: "チョイス#{j + 1} for 問題#{i + 1}", correct: correct)
  end
end