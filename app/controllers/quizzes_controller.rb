class QuizzesController < ApplicationController
  def index
    @question = Question.first
  end

  def new
    @question = Question.includes(:choices).order("RANDOM()").first
  end

  def check_answer
    # ユーザーの回答をチェックし、正誤判定を行うロジック
    # 次の問題の表示に必要なデータを設定
    @next_question = Question.includes(:choices).order("RANDOM()").first

    respond_to do |format|
      format.js
    end
  end

  def next_question
    # 次の問題を取得するロジックをここに追加
    @next_question = Question.includes(:choices).order("RANDOM()").first

    respond_to do |format|
      format.js
    end
  end
end