Rails.application.routes.draw do
  root 'searches#index'

  resources :monsters, only: [:create]
end
