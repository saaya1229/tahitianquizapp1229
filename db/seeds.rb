# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
questions = Question.create([
  { content: '質問1' },
  { content: '質問2' },
  # 他の質問を追加
])

# 質問に対する選択肢を作成
questions.each do |question|
  question.choices.create([
    { content: '選択肢1', correct: true },
    { content: '選択肢2', correct: false },
    # 他の選択肢を追加
  ])
end

