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
      $('.pre-choice-message').hide();

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
            // 正解の選択肢を緑にする
            $('li[data-choice-id="' + choiceId + '"]').removeClass('choice').addClass('correct-choice');
            $('.correct-message').show();
            canProceed = false;

            setTimeout(function() {
              $('.correct-message').hide();
              canProceed = true;
              getNextQuestion();
            }, 1000);
          } else {
            // 不正解の選択肢を赤くする
            $('li[data-choice-id="' + choiceId + '"]').removeClass('choice').addClass('incorrect-choice');
            $('.incorrect-message').show();

            setTimeout(function() {
              $('#next-question-button').show();
              $('.next-question').slideDown(200);
            }, 1000);

            $('#next-question-button').one('click', function() {
              $('.incorrect-message').hide();
              $('#next-question-button').hide();
              $('.next-question').hide();
              canProceed = true;
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
        var radio = $('<input type="radio" id="selected_choice_' + choice.id + '" name="selected_choice" value="' + choice.id + '">');
        var label = $('<label for="selected_choice_' + choice.id + '">' + choice.content + '</label>');

        li.append(radio);
        li.append(label);

        // 選択肢をクリックしたら回答処理を行う
        li.on('click', function() {
          handleAnswerClick(choice.id);
        });
        li.addClass('choice');
        $('.question-choice ul').append(li);
      });
    }
  }

  // クイズを初期化
  initializeQuiz();
});









function selectAnswer(e){
  const selectBtn = e.target;
  const isCorrect = selectBtn.dataset.correct === "true";
  if(isCorrect){
    selectBtn.classList.add("correct");
  }else{
    selectBtn.classList.add("incorrect");
  }
  Array.from(answerButtons.children).forEach(button => {
    if(button.dataset.correct === "true"){
      button.classList.add("correct");
    }
    button.disabled = true;
  });
  nextButton.style.display = block;
}