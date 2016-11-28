Rails.application.routes.draw do
  resources :players
  resources :teams
  resources :matches
  root to: 'visitors#index'
  devise_for :users
end
