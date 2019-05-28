Rails.application.routes.draw do
  root to: 'pages#home'
  devise_for :users
  resources :pokemons, except: [:destroy] do
    resources :bookings, except: %i[edit update]
  end
  resources :bookings, only: [:index, :show, :destroy]
end
