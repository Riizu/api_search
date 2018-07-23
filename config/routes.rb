Rails.application.routes.draw do
  root 'search#index'

  resources :monsters, only: [:create]
  resources :search, only: [:create, :show]
end
