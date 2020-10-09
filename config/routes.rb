Rails.application.routes.draw do
  devise_for :users
  get 'symptoms/index'
  root to: "symptoms#index"
end
