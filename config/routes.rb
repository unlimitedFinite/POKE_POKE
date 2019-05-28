Rails.application.routes.draw do
  root to: 'pages#home'
  devise_for :users
  patch "pokemons/:id/reactivate", to: "pokemons#reactivate", as: "reactivate"
  patch "pokemons/:id/deactivate", to: "pokemons#deactivate", as: "deactivate"
  resources :pokemons do
    resources :bookings, except: %i[edit update]
  end
  resources :bookings, only: [:index, :show, :destroy]
end
