import $ from 'jquery';
import axios from 'axios';


$('.quiz-question li').on('click', function() {
  const choiceId = $(this).data('choice-id');

  $.ajax({
    type: 'POST',
    url: '/check_answer',
    data: { choice_id: choiceId },
    headers: {
      'X-CSRF-Token': $('meta[name="csrf-token"]').attr('content')
    },
    success: function(response) {
      if (response.correct) {
        alert('正解です！');
        // 正解の場合、クリックしなくても次の問題を取得するためのAjaxリクエストを送信
        $.ajax({
          type: 'GET',
          url: '/next_question',
          success: function(nextQuestion) {
            // 次の問題を表示
            $('.quiz-question p').text(nextQuestion.content);
          }
        });
      } else {
        alert('不正解です。クリックして次の問題に進んでください。');
        // 不正解の場合、クリック時に次の問題を取得するためのフラグを設定
        let canProceed = false;
        $(document).one('click', function() {
          if (canProceed) {
            $.ajax({
              type: 'GET',
              url: '/next_question',
              success: function(nextQuestion) {
                // 次の問題を表示
                $('.quiz-question p').text(nextQuestion.content);
              }
            });
          } else {
            alert('クリックして次の問題に進んでください。');
          }
        });
        // 不正解の場合、次の問題に進むフラグを設定
        canProceed = true;
      }
    }
  });
});
