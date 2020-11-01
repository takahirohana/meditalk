Rails.application.routes.draw do

  devise_for :users, controllers: {
    omniauth_callbacks: 'users/omniauth_callbacks',
    registrations: 'users/registrations'
  }
  devise_scope :user do
    get'symptoms', to: 'users/registrations#new_symptom'
    post 'symptoms', to: 'users/registrations#create_symptom'
  end
    root to:'rooms#index'  
  resources :users, only: [:new, :edit, :update]
  resources :rooms, only: [:new, :create, :destroy] do
    resources :messages, only: [:index, :create]
  end
  resources :symptoms, only: [:new, :create] 
  resources :doctors, only: [:index, :new, :show, :edit, :create]
end
