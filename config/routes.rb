Rails.application.routes.draw do
  devise_for :users 
  root to:'homes#top'
  get "/home/about" =>"homes#about"
  resources :users, only: [:index, :create, :edit, :show, :update]
  resources :books, only: [:index, :create, :edit, :show, :destroy, :update]

end
