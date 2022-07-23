Rails.application.routes.draw do

 devise_for :users
 root 'homes#top'
 get "homes/about" => "homes#about", as: 'about'
 resources :books, only: [:index, :show, :create, :edit, :update, :destroy]
 resources :users, only: [:show, :edit]

end
