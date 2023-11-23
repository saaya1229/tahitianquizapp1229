class QuizzesController < ApplicationController
  def new
    shuffled_question_ids = Question.pluck(:id).shuffle
    session[:shuffled_question_ids] = shuffled_question_ids
    @question = load_next_question
  end

  def load_next_question
    question_id = session[:shuffled_question_ids].pop
    Question.includes(:choices).find(question_id)
  end

  def check_answer
    # ユーザーの回答をチェックし、正誤判定を行うロジック
    # ここで正解不正解の判定ロジックを実行
    if answer_is_correct(params[:choice_id].to_i)
      @result_message = '正解です！'
    # 正解数をセッションに追加
    session[:correct_answers] ||= []
    session[:correct_answers] << true
    else
      @result_message = '残念！'
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
      return false
    end
  end

  def next_question
    @next_question = load_next_question
    respond_to do |format|
      format.json { render json: next_question_data }
    end
  end

  def result
    @correct_answers = session[:correct_answers] || []  # セッションから取得し、存在しない場合は空の配列をセット
    @total_questions = Question.count  # 総問題数
  
    # 正解数を計算
    @num_correct_answers = @correct_answers.size
  
    # ...（他に必要な処理があれば追加）
  
    # 最終的な結果を表示するための処理などがあればここで行う
  
    # 最後にsessionをクリア（コメントアウトするか、正解数を取得した後にクリアする）
    reset_session
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