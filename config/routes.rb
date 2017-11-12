Rails.application.routes.draw do
  namespace :api do
    post "signup", to: "users#create"
    post "signin", to: "users#signin"

    get "topics", to: "topics#index"
    resources :users, only: [] do
      collection do
        post "by_telegram_id", to: "users#by_telegram_id"
      end
      member do
        post "set_telegram_id", to: "users#set_telegram_id"
      end
      resources :topics, only: [:create, :index], controller: "users/topics"
      resources :events, only: [:create, :index], controller: "users/events"
    end

    resources :events, only: [:index] do
      resources :participants, only: [:create, :index], controller: "events/participants"
      post "telegram_participants", to: "events/participants#telegram_participants"
    end

    post "telegram_events", to: "telegram_events#create", controller: "telegram_events"

    post "search", to: "events#search"
  end
end
