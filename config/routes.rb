Rails.application.routes.draw do
  resources :polls
  devise_for :users
  get "options/answer/:id", to: "options#answer"
  root to: "polls#index"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
