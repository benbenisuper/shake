Rails.application.routes.draw do
  root to: 'pages#home', as: 'root'

  devise_for :users

  resources :venues
  resources :bookings do
    resources :reviews, only: %i[new create]
  end

  resources :membership

  get 'dashboard', to: 'pages#dashboard', as: 'dashboard'
end
