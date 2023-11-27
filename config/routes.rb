Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: 'home#index'

  get '/quizzes', to: 'quizzes#new'

  post '/check_answer', to: 'quizzes#check_answer'
  get '/next_question', to: 'quizzes#next_question'

  get '/result', to: 'quizzes#result'  # /result へのGETリクエストに対応するルートを追加


  resources :quizzes, only: [:new] do
    post :check_answer, on: :collection
    get :next_question, on: :collection
    get :result, on: :collection  # 結果発表画面用のルートを追加
  end
end
