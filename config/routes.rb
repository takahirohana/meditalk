Rails.application.routes.draw do

  
  root 'tops#index'
  devise_for :doctors, controllers: {
    sessions:       'doctors/sessions',
    passwords:      'doctors/passwords',
    registrations:  'doctors/registrations'
  }
  devise_for :users, controllers: {
    omniauth_callbacks: 'users/omniauth_callbacks',
    sessions:           'users/sessions',
    passwords:          'users/passwords',
    registrations: 'users/registrations'
  }
  devise_scope :user do
    get'symptoms', to: 'users/registrations#new_symptom'
    post 'symptoms', to: 'users/registrations#create_symptom'
  end
    # root to:'doctors#index'  
  resources :users, only: [:new, :edit, :update]
  resources :rooms, only: [:index,:new, :create,:show] do
    resources :messages, only: [:index, :create]
  end
  resources :symptoms, only: [:edit,:update] 
  resources :doctors, only: [:index, :new, :show, :edit, :create] do
    resources :ratings, only: [:index, :create]
  end
end
