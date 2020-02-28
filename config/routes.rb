Rails.application.routes.draw do

  devise_for :users
  root to: redirect('/welcome', status: 302)

  get 'welcome', to: 'static_pages#welcome', as: 'welcome'
  get 'about', to: 'static_pages#about', as: 'about'
  get 'contact', to: 'static_pages#contact', as: 'contact'
  post 'contact', to: 'static_pages#leave_feedback', as: 'leave_feedback'

  # get 'mc_questions', to: 'mc_questions#index', as: 'mc_questions' # index
  get 'quizzes/:id/mc_questions', to: 'quiz_mc_questions#index', as: 'quiz_mc_questions' # nested index
  # get 'mc_questions/new', to: 'mc_questions#new', as: 'new_mc_question' # new
  get 'quizzes/:id/mc_questions/new', to: 'quiz_mc_questions#new', as: 'new_quiz_mc_question' # nested new
  # post 'mc_questions', to: 'mc_questions#create' # create
  post 'quizzes/:id/mc_questions', to: 'quiz_mc_questions#create' # nested create
  get 'mc_questions/:id', to: 'mc_questions#show', as: 'mc_question' # show
  get 'mc_questions/:id/edit', to: 'mc_questions#edit', as: 'edit_mc_question' # edit
  patch 'mc_questions/:id', to: 'mc_questions#update' # update (as needed)
  put 'mc_questions/:id', to: 'mc_questions#update' # update (full replacement)
  delete 'mc_questions/:id', to: 'mc_questions#destroy' # destroy

  get 'quizzes', to: 'quizzes#index', as: 'quizzes' # index
  get 'quizzes/:id', to: 'quizzes#show', as: 'quiz' # show
  get 'quizzes/:id/edit', to: 'quizzes#edit', as: 'edit_quiz' # edit
  put 'quizzes/:id', to: 'quizzes#update' # update (put)
  patch 'quizzes/:id', to: 'quizzes#update' # update (patch)
  delete 'quizzes/:id', to: 'quizzes#destroy' # destroy

  get 'account/quizzes', to: 'account_quizzes#index', as: 'account_quizzes' # my quizzes page
  get 'account/quizzes/new', to: 'account_quizzes#new', as: 'new_account_quiz'
  post 'account/quizzes', to: 'account_quizzes#create'

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
