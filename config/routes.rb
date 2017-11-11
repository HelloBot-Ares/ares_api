Rails.application.routes.draw do
  namespace :api do
    post "signup", to: "users#create"

    resources :topics, only: [:index]
  end
end
