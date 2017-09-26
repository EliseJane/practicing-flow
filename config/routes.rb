Rails.application.routes.draw do
  root to: 'todos#index'

  get '/register', to: 'users#new'
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  get '/logout', to: 'sessions#destroy'

  resources :users, only: [:create, :show, :edit, :update]

  resources :todos

  post '/todos/:id/complete', to: 'todos#toggle_complete'
end
