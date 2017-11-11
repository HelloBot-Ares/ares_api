Rails.application.routes.draw do
  namespace :api do
    post "signup", to: "users#create"
    get "topics", to: "topics#index"
    resources :users, only: [] do
      resources :topics, only: [:create, :index], controller: "users/topics"
    end
  end
end
