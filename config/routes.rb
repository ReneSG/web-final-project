Rails.application.routes.draw do
  resources :polls
  devise_for :users
  get "options/answer/:id", as: "option_answer", to: "options#answer"
  post "options/register_response/:id", as: "option_response", to: "options#register_response"
  root to: "polls#index"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
