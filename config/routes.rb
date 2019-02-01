Rails.application.routes.draw do
  resources :cards
  resources :cardstates
  resources :users
  root 'users#index'
end