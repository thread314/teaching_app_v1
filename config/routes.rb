Rails.application.routes.draw do
  resources :cards
  resources :cardstates
  resources :users
  root 'users#index'
  get    '/login',   to: 'sessions#new'
  post   '/login',   to: 'sessions#create'
  delete '/logout',  to: 'sessions#destroy'

  #get '/signup', to: 'users#new'
  #get '/sessions/new'
  #post "/sessions/new", to: "sessions#create"
end