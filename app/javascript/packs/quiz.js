import $ from 'jquery';
import axios from 'axios';

document.addEventListener("DOMContentLoaded", function() {
  let currentQuestion = 1; // 現在の問題番号をトラッキング
  let totalQuestions = 10; // クイズの総問題数
  let canProceed = false; // クリックで次の問題に進めるようにフラグを初期化

  function initializeQuiz() {
    getNextQuestion(); // 最初の問題を取得して表示
    $('.pre-choice-message').show();
  }

  function handleAnswerClick(choiceId) {
    if (canProceed) {
      canProceed = false;
      $('.pre-choice-message').hide(); // 選択前の説明メッセージを非表示にする
      $.ajax({
        type: 'POST',
        url: '/check_answer',
        data: { choice_id: choiceId },
        headers: {
          'X-CSRF-Token': $('meta[name="csrf-token"]').attr('content')
        },
        dataType: 'json',
        success: function(response) {
          if (response.correct) {
            $('.correct-message').show(); // 正解のメッセージを表示
            canProceed = false; // 正解メッセージが表示中は進行不可にする
            // 正解メッセージを1秒で非表示にする
            setTimeout(function() {
              $('.correct-message').hide();
              canProceed = true; // 1秒後に進行を再び有効にする
              getNextQuestion();
            }, 1000); // 1000ミリ秒 (1秒) 後に非表示にする
          } else {
            $('.incorrect-message').show(); // 不正解のメッセージを表示
            // 不正解の場合、クリックで次の問題に進むようにイベントリスナーを設定
            $('.question-choice').one('click', function() {
              $('.incorrect-message').hide(); // メッセージを非表示に
              canProceed = true; // 不正解メッセージを非表示にしたら進行を有効にする
              getNextQuestion();
            });
          }
        }
      });
    }
  }

  function getNextQuestion() {
    if (currentQuestion <= totalQuestions) {
      $('.pre-choice-message').show();
      $.ajax({
        type: 'GET',
        url: '/next_question',
        success: function(nextQuestion) {
          if (nextQuestion) {
            $('.current-number p').text(currentQuestion + '/' + totalQuestions); // 現在の問題番号を表示
            $('.question-word p').text(nextQuestion.content); // 質問の内容を表示
            updateChoices(nextQuestion.choices);
            canProceed = true; // 次の問題を表示してから進行を許可
            currentQuestion++;
          } else {
            console.log('次の問題が見つかりませんでした。'); // コンソールにメッセージを表示
          }
        }
      });
    } else {
      console.log('クイズ終了。'); // コンソールにメッセージを表示
    }
  }

  function updateChoices(choices) {
    // 選択肢のリストをクリア
    $('.question-choice ul').empty();

    if (choices && choices.length > 0) {
      choices.forEach(function(choice) {
        var li = $('<li data-choice-id="' + choice.id + '">');
        var radio = $('<input type="radio" name="selected_choice" value="' + choice.id + '">');
        var label = $('<label for="selected_choice_' + choice.id + '">' + choice.content + '</label>');

        li.append(radio);
        li.append(label);

        // 選択肢をクリックしたら回答処理を行う
        li.on('click', function() {
          handleAnswerClick(choice.id);
        });

        $('.question-choice ul').append(li);
      });
    }
  }

  // クイズを初期化
  initializeQuiz();
});