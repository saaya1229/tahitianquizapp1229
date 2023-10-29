import $ from 'jquery';
import axios from 'axios';

$(document).ready(function() {
  $('.quiz-question li').on('click', function() {
    const choiceId = $(this).data('choice-id');
    $.ajax({
      type: 'POST',
      url: '/check_answer',
      data: { choice_id: choiceId },
      headers: {
        'X-CSRF-Token': $('meta[name="csrf-token"]').attr('content')
      },
      dataType: 'json',  // JSONデータを受け取ることを指定
      success: function(response) {
        if (response.correct) {
          alert(response.message);  // 正解不正解のメッセージを表示
          // 正解の場合、次の問題を取得して表示
          getNextQuestion();
        } else {
          alert(response.message);  // 正解不正解のメッセージを表示
          // 不正解の場合、次の問題を表示せず、次に進むフラグを設定
          let canProceed = false;
          $(document).one('click', function() {
            canProceed = true;
          });
        }
      }
    });
  });
});
