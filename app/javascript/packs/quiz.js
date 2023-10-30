import $ from 'jquery';
import axios from 'axios';

$(document).ready(function() {
  let canProceed = false; // 初期状態では進行不可
  let currentQuestion = 1; // 現在の問題番号をトラッキング

  function initializeQuiz() {
    getNextQuestion(); // 最初の問題を取得して表示
  }

  function handleAnswerClick(choiceId) {
    if (!canProceed) {
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
            currentQuestion++; // 問題番号を更新
            if (currentQuestion <= 10) {
              getNextQuestion();
            } else {
              // クイズ終了条件：10問目の後に結果を表示するなどの処理を追加
              alert('クイズ終了。結果を表示する処理を追加してください。');
            }
          } else {
            // 不正解の場合、次に進むフラグを設定
            canProceed = true;

            // 不正解の場合、次の問題に進むためのクリックリスナーを設定
            // ユーザーがどこかをクリックしたら次の問題に進めるようにする
            $(document).one('click', function() {
              getNextQuestion();
            });
          }
        }
      });
    }
  }
  

  function getNextQuestion() {
    $.ajax({
      type: 'GET',
      url: '/next_question',
      success: function(nextQuestion) {
        // 次の問題を表示
        if (nextQuestion) {
          $('.quiz-question p').text(nextQuestion.content);
          updateChoices(nextQuestion.choices);
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
      choices.forEach(function(choice) {
        var li = $('<li data-choice-id="' + choice.id + '">');
        var radio = $('<input type="radio" name="selected_choice" value="' + choice.id + '">');
        var label = $('<label for="selected_choice_' + choice.id + '">' + choice.content + '</label>');

        li.append(radio);
        li.append(label);

        // 選択肢をクリックしたら回答処理を行う
        li.on('click', function() {
          if (!canProceed) {
            handleAnswerClick(choice.id);
          }
        });

        $('.quiz-question ul').append(li);
      });
    }
  }

  // クイズを初期化
  initializeQuiz();
});
