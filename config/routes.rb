Rails.application.routes.draw do
  namespace :admin do
      resources :users
      resources :bookings
      resources :reviews
      resources :venues

      root to: "users#index"
    end
  root to: 'pages#home', as: 'root'

  devise_for :users

  resources :venues
  resources :bookings do
    resources :reviews, only: %i[new create]
  end

  resources :membership

  get 'dashboard', to: 'pages#dashboard', as: 'dashboard'
end
