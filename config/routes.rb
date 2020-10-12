Rails.application.routes.draw do
  devise_for :users, controllers: {
    omniauth_callbacks: 'users/omniauth_callbacks',
    registrations: 'users/registrations'
  }
  get 'symptoms/index'
  root 'users#index'  
  resources :users, only: :new
end

#   root to: "symptoms#index"