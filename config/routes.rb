Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: 'home#index'

  get '/quiz', to: 'quizzes#new'

  post '/check_answer', to: 'quizzes#check_answer'
  get '/next_question', to: 'quizzes#next_question'


  resources :quizzes, only: [:new] do
    post :check_answer, on: :collection
  end
end
