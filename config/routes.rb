Rails.application.routes.draw do
  resources :users
  devise_for :users
  root 'prototypes#index'

  resources :prototypes, only: [:index, :new, :show]
  resources :users, only:[:show, :edit]

end
