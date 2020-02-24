Rails.application.routes.draw do
  root to: 'pages#home', as: 'home'

  devise_for :users

  resources :venues
  resources :bookings do
    resources :reviews
  end

  resources :membership

end
