Rails.application.routes.draw do
  namespace :api do
    post "signup", to: "users#create"
    post "signin", to: "users#signin"

    get "topics", to: "topics#index"
    resources :users, only: [] do
      resources :topics, only: [:create, :index], controller: "users/topics"
    end

    resources :events, only: [:create]
  end
end
