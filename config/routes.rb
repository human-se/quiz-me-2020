Rails.application.routes.draw do
  root to: redirect('/welcome', status: 302)
  get 'welcome', to: 'static_pages#welcome', as: 'welcome'
  get 'about', to: 'static_pages#about', as: 'about'
  get 'contact', to: 'static_pages#contact', as: 'contact'
  post 'contact', to: 'static_pages#leave_feedback', as: 'leave_feedback'
  get 'mc_questions', to: 'mc_questions#index', as: 'mc_questions' # index
  get 'mc_questions/:id', to: 'mc_questions#show', as: 'mc_question' # show
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
