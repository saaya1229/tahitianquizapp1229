import $ from 'jquery'
import axios from 'axios'

// quiz.js

// クイズの選択肢がクリックされたときの処理
$('.quiz-question li').on('click', function() {
  // 選択された選択肢のIDを取得
  debugger
  const choiceId = $(this).data('choice-id');

  // Ajaxリクエストを送信
  $.ajax({
    type: 'POST',
    url: '/check_answer', // サーバーの処理を呼び出すURL
    data: { choice_id: choiceId }, // 選択肢のIDを送信
    success: function(response) {
      // 正解または不正解のメッセージを表示
      alert(response.message);

      // 次の問題を取得するためのAjaxリクエストを送信
      $.ajax({
        type: 'GET',
        url: '/next_question', // 次の問題を取得するURL
        success: function(nextQuestion) {
          // 次の問題を表示
          $('.quiz-question p').text(nextQuestion.content);
        }
      });
    }
  });
});