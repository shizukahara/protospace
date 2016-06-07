Rails.application.routes.draw do
  devise_for :users
  resources :users
  root 'prototypes#index'

  resources :prototypes, only: [:index, :new, :show]
  resources :users, only:[:show, :edit]

end
