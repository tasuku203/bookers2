Rails.application.routes.draw do

  root to: 'homes#top'
  devise_for :users
  resources :books

  get "home/about" => "homes#about"

end