Rails.application.routes.draw do
  devise_for :users
  resources :users
  root 'prototypes#index'

  resources :prototypes, except: :index do
     resources :comments, only: :create
     resources :likes, only:[:create, :destroy]
  end

  resources :users, only:[:show, :edit, :update]

end
