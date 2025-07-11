Rails.application.routes.draw do
  devise_for :users, controllers: {
  registrations: 'users/registrations',
  sessions: 'users/sessions'
}
  
  root 'homes#top'
  get 'home/about', to: 'homes#about'

  resources :users, only: [:index, :show ]
  resources :post_images, only: [:new, :create, :index, :show, :destroy]
  # 1つのブログに対してユーザーは1つだけお気に入りできる
  # 各ブログに対して「いいね（お気に入り）」機能
  resources :blogs, only: [:index, :show, :create,:edit, :update, :destroy] do
    resource :favorites, only: [:create, :destroy]
    
  end  
  
  get "search" => "searches#search"

end