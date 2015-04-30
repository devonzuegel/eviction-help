Rails.application.routes.draw do
  root to: 'visitors#index'
  get 'start' => 'visitors#start'
  
  devise_for :users
  resources :users
  resources :questions
end
