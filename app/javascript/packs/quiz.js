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
      success: function(response) {
        // 回答の正誤に応じてメッセージを表示
        if (response.correct) {
          alert('正解です！');
          // 次の問題を取得して表示
          getNextQuestion();
        } else {
          alert('不正解です！');
        }
      }
    });
  });
  
  // 何か画面をクリックしたときに次の問題に進む
  $(document).on('click', function() {
    getNextQuestion();
  });
  
  // 次の問題を取得する関数
  function getNextQuestion() {
    $.ajax({
      type: 'GET',
      url: '/next_question',
      success: function(nextQuestion) {
        $('.quiz-question p').text(nextQuestion.content);
      }
    });
  }
});
