Rails.application.routes.draw do
  root to: 'pages#home', as: 'home'

  devise_for :users do
    resources :venues
    resources :bookings do
      resources :reviews
    end
  end

  resources :membership

end
