Rails.application.routes.draw do
  get 'event_notices/new'
  devise_for :users
  root to: "homes#top"
  get "home/about" => "homes#about"
  get 'search' => "searches#search"

  resources :books, only: [:index,:show,:edit,:create,:destroy,:update] do
    resource :favorites, only: [:create, :destroy]
    resources :book_comments, only: [:create, :destroy]
  end
  resources :users, only: [:index,:show,:edit,:update] do
    resource :relationships, only: [:create, :destroy]
    get 'follows' => 'relationships#follower'
    get 'followers' => 'relationships#followed'
  end

  resources :groups, except: [:destroy] do
    resource :group_users, only: [:create, :destroy]
    resources :event_notices, only: [:new, :create]
    get 'event_notices' => 'event_notices#sent'
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
