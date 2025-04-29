Rails.application.routes.draw do
  devise_for :users
  
  root 'homes#top'
  get 'home/about', to: 'homes#about'

  resources :users, only: [:index, :show ]
  
  resources :blogs, only: [:index, :show, :create,:edit, :update, :destroy] do
    resource :favorites, only: [:create, :destroy]
  end  
  
  get "search" => "searches#search"

end