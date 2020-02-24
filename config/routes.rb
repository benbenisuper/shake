Rails.application.routes.draw do
  root to: 'pages#home', as: 'home'

  resources :venues

  resources :bookings

  resources :membership

  resources :reviews
end
