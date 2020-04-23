Rails.application.routes.draw do
  require 'sidekiq/web'

  mount Sidekiq::Web => '/sidekiq'

  root 'aircrafts#index'

  resources :aircrafts, only: [] do
    patch :take_off, on: :member
  end
end
