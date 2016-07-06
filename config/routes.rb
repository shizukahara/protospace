Rails.application.routes.draw do
  devise_for :users
  resources :users
  root 'prototypes#index'

  resources :prototypes, only: [:update, :show, :create, :new, :edit, :destroy] do
     resources :comments, only: :create
  end

  resources :users, only:[:show, :edit, :update]

end
