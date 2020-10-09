Rails.application.routes.draw do
  get 'symptoms/index'
  root to: "symptoms#index"
end
