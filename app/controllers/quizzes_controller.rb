class QuizzesController < ApplicationController
  def index
    @question = Question.first
  end

  def new
    @question = Question.includes(:choices).order("RANDOM()").first
  end

  def check_answer
    # ユーザーの回答をチェックし、正誤判定を行うロジック
    # ここで正解不正解の判定ロジックを実行
    if answer_is_correct(params[:choice_id].to_i)
      @result_message = '正解です！'
    else
      @result_message = '不正解です。'
    end
  
    # 正解不正解の情報を含むJSONを返す
    response_data = {
      correct: answer_is_correct(params[:choice_id].to_i),
      message: @result_message
    }
  
    respond_to do |format|
      format.json { render json: response_data }
    end
  end

  def answer_is_correct(choice_id)
    # 選択肢のデータを取得
    choice = Choice.find(choice_id)
  
    # 選択肢が正解かどうかを確認
    if choice.correct?
      return true  # 正解の場合
    else
      return false  # 不正解の場合
    end
  end

  def next_question
    # 次の問題を取得するロジック
    @next_question = Question.includes(:choices).order("RANDOM()").first
  
    respond_to do |format|
      format.json { render json: next_question_data }
    end
  end
  
  private
  
  def next_question_data
    if @next_question
      {
        id: @next_question.id,
        content: @next_question.content,
        choices: @next_question.choices.map do |choice|
          {
            id: choice.id,
            content: choice.content
          }
        end
      }
    else
      nil
    end
  end
  
end
