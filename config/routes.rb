Rails.application.routes.draw do

 root  'homes#top'
 devise_for :users

 resources :books, only: [:new, :create, :index, :show]
  
 get "homes/about" => "homes#about", as: 'about'

end
