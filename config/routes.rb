Rails.application.routes.draw do
  root to: 'pages#home'
  resources :pokemons
  resources :bookings, except: %i[edit update]
  devise_for :users

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
