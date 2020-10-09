Rails.application.routes.draw do
  devise_for :users
  get 'symptoms/index'
  root 'users#index'  
  resources :users, only: :new
end

#   root to: "symptoms#index"