Rails.application.routes.draw do
  root 'searches#index'

  resources :monsters, only: [:create]
  resources :search, only: [:create, :show]
end
