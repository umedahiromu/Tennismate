Rails.application.routes.draw do
  get 'rooms/show'
  devise_for :users
  root to: "top#index"
  resources :top, only: [:index]
  resources :check, only: [:index]
  resources :users, only: [:show, :edit, :update] do
    member do
      get 'video'
    end
  end
  resources :recruit_players do
    resources :players_comments
    resources :likes, only: [:create, :destroy]
    member do
      get 'likedmember'
    end
  end
  resources :relationships do
    member do
      get "following"
      get "follower"
    end
  end
  resources :notifications, only: :index
  resources :rooms
   
  
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
