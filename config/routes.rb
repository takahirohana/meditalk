Rails.application.routes.draw do
  devise_for :users, controllers: {
    omniauth_callbacks: 'users/omniauth_callbacks',
    registrations: 'users/registrations'
  }
  get 'symptoms/index'
  root 'symptoms#index'  
  resources :users, only: [:new, :edit, :update]
end

#   root to: "symptoms#index"