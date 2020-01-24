Rails.application.routes.draw do
  get 'welcome', to: 'static_pages#welcome', as: 'welcome'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
