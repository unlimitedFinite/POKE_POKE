Rails.application.routes.draw do
  root to: 'pokemon#index'
  resources :bookings, except: %i[edit update]
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
