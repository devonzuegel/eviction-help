Rails.application.routes.draw do
  resources :cases
  resources :clients
  resources :attorneys
  root to: 'visitors#index'
  get 'start' => 'visitors#start'
  
  devise_for :users, controllers: { sessions: "users/sessions", registrations: "users/registrations" }
  resources :users
  resources :questions
end