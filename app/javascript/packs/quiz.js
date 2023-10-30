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
        // 選択肢を更新
        updateChoices(nextQuestion.choices); // updateChoices 関数を呼び出し
      } else {
        alert('次の問題が見つかりませんでした。');
      }
    }
  });
}

function updateChoices(choices) {
  // 選択肢のリストをクリア
  $('.quiz-question ul').empty();

  if (choices && choices.length > 0) {
    // 選択肢が存在し、長さが1以上である場合にのみ処理を行う
    choices.forEach(function(choice) {
      var li = $('<li data-choice-id="' + choice.id + '">');
      var radio = $('<input type="radio" name="selected_choice" value="' + choice.id + '">');
      var label = $('<label for="selected_choice_' + choice.id + '">' + choice.content + '</label>');
      
      li.append(radio);
      li.append(label);
      
      $('.quiz-question ul').append(li);
    });
  }
}
