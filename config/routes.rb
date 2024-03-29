Rails.application.routes.draw do
  root to: 'toppages#index'
  
  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'

  
  get 'signup', to: 'users#new'
  resources :users, only: [:index, :show, :create,] do
    member do
      get :followings
      get :followers
    end
    collection do
      get :search
    end
  end
  resources :users, only: [:index, :show, :create,] do
    member do
      get :likes
    end
  end
  
  resources :microposts, only: [:destroy, :create]
  resources :relationships, only: [:create, :destroy]
  resources :favorites, only: [:create, :destroy]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
