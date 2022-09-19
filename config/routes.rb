Rails.application.routes.draw do
  root 'home#index'

  get 'auth/:provider/callback', to: 'sessions#create'
  get 'auth/failure', to: redirect('/')
  get 'log_out', to: 'sessions#destroy', as: 'log_out'

  resources :sessions, only: %i[create destroy]
  resources 'aims'
  resources 'books'
  resources 'subscriptions'
  resources 'mobile_contracts'
  resources 'house_contracts'
  resources 'competitors'
  resources 'categories'

  namespace :api, { format: 'json' } do
    resources 'aims'
    resources 'future_aims'
    resources 'books'
    resources 'subscriptions'
    resources 'mobile_contracts'
    resources 'house_contracts'
    resources 'competitors'
    resources 'categories'
    resources 'todos'
  end
end
