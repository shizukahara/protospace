Rails.application.routes.draw do
  devise_for :users
  resources :users
  root 'prototypes#index'

  resources :prototypes, only: [:update, :show, :create, :new]
  resources :users, only:[:show, :edit, :update]

end
