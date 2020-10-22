Rails.application.routes.draw do
  devise_for :users, controllers: {
    omniauth_callbacks: 'users/omniauth_callbacks',
    registrations: 'users/registrations'
  }
  # get 'symptoms/index'
  root to:'rooms#index'  
  resources :users, only: [:new, :edit, :update]
  resources :rooms, only: [:new, :create, :destroy] do
    resources :messages, only: [:index, :create]
  end
  resources :symptoms, only: [:new, :create] 
end

#   root to: "symptoms#index"