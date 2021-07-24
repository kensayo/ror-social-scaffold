Rails.application.routes.draw do

  root 'posts#index'

  devise_for :users

  resources :users, only: [:index, :show] do
    post 'add-friend', to: 'friendship#create'
    get 'friend-request', to: 'friendship#index'
    put 'update', to: 'friendship#update'
  end
  resources :posts, only: [:index, :create] do
    resources :comments, only: [:create]
    resources :likes, only: [:create, :destroy]
  end

end
