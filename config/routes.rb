Rails.application.routes.draw do
  resources :teams
  resources :matches
  root to: 'visitors#index'
  devise_for :users
end
