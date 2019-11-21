Rails.application.routes.draw do
  resources :polls
  devise_for :users
  get "options/answer/:id", as: "option_answer", to: "options#answer"
  get "poll/my_polls", as: "my_polls", to: "polls#my_polls"
  post "options/register_response/:id", as: "option_response", to: "options#register_response"
  post "polls/start/:id", as: "polls_start", to: "polls#start"
  root to: "polls#index"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
