Rails.application.routes.draw do
  namespace :api do
    post "signup", to: "users#create"
    resources :users, only: [] do
      resources :topics, only: [:create, :index], controller: "users/topics"
    end
  end
end
