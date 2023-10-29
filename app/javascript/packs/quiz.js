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
        if (response.correct) {
          alert('正解です！');
          // 正解の場合、次の問題を取得して表示
          getNextQuestion();
        } else {
          alert('不正解です。');
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

function getNextQuestion() {
  $.ajax({
    type: 'GET',
    url: '/next_question',
    success: function(nextQuestion) {
      // 次の問題を表示
      $('.quiz-question p').text(nextQuestion.content);
      // 選択肢を更新する方法を追加
      updateChoices(nextQuestion.choices);
    }
  });
}

function updateChoices(choices) {
  // 選択肢のリストをクリア
  $('.quiz-question ul').empty();

  // 選択肢をリストに追加
  choices.forEach(function(choice) {
    var li = $('<li data-choice-id="' + choice.id + '">');
    li.text(choice.content);
    $('.quiz-question ul').append(li);
  });
}
