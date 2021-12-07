Rails.application.routes.draw do
  devise_for :users
  root to:'homes#top'
  get "/home/about" =>"homes#about"
  resources :users, only: [:index, :create, :edit, :show, :update]
  resources :books, only: [:index, :create, :edit, :show, :destroy, :update] do
    resources :book_comments, only: [:create, :destroy]
    resource :favorites, only: [:create, :destroy]
  end

end
