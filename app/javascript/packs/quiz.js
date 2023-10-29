import $ from 'jquery';
import axios from 'axios';

$(document).ready(function() {
  let canProceed = false; // 初期状態では進行不可

  $('.quiz-question li').on('click', function() {
    const choiceId = $(this).data('choice-id');
    $.ajax({
      type: 'POST',
      url: '/check_answer',
      data: { choice_id: choiceId },
      headers: {
        'X-CSRF-Token': $('meta[name="csrf-token"]').attr('content')
      },
      dataType: 'json',
      success: function(response) {
        alert(response.message);
        if (response.correct) {
          // 正解の場合、次の問題を取得して表示
          getNextQuestion();
        } else {
          // 不正解の場合、次に進むフラグを設定
          canProceed = true;
        }
      }
    });
  });

  // 別の場所をクリックしたら次の問題に進む
  $(document).on('click', function() {
    if (canProceed) {
      getNextQuestion();
      canProceed = false; // フラグをリセット
    }
  });
});

function getNextQuestion() {
  $.ajax({
    type: 'GET',
    url: '/next_question',
    success: function(nextQuestion) {
      // 次の問題を表示
      if (nextQuestion) {
        $('.quiz-question p').text(nextQuestion.content);
        // 選択肢を更新する方法を追加
        updateChoices(nextQuestion.choices);
      } else {
        alert('次の問題が見つかりませんでした。');
      }
    }
  });
}
