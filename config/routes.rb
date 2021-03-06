Rails.application.routes.draw do
  devise_for :users
  root 'prototypes#index'

  #ネスト
  resources :prototypes, except: :index do
    resources :comments, only: :create
    resources :likes, only: [:create, :destroy]
  end

  #controller間のグルーピング
  scope module: :prototypes do
    resources :newest, only: :index
    resources :popular, only: :index
    resources :tags, only: [:index, :show]
  end

  resources :users, only: [:show, :edit, :update]

end
