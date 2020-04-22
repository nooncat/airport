Rails.application.routes.draw do
  root 'aircrafts#index'

  resources :aircrafts, only: [] do
    patch :take_off, on: :member
  end
end
