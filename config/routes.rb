Rails.application.routes.draw do
  devise_for :users
  
  root 'homes#top'
  get 'home/about', to: 'homes#about'

  resources :users, only: [:index, :show ]
  
  # 1つのブログに対してユーザーは1つだけお気に入りできる
  # 各ブログに対して「いいね（お気に入り）」機能
  resources :blogs, only: [:index, :show, :create,:edit, :update, :destroy] do
    resource :favorites, only: [:create, :destroy]
  end  
  
  get "search" => "searches#search"

end