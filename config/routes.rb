Rails.application.routes.draw do
  root to: 'todos#index'

  resources :todos

  post '/todos/:id/complete', to: 'todos#complete'
end
