Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  resources :superpowers do
    resources :reservations, only: [ :destroy, :edit, :update ] do
    resources :reservations, only: [ :new, :create ] do
      resources :reviews, only: [:create, :index, :show]
    end
    resources :reservations, only: [ :destroy, :edit, :update, :index, :show]
  end
  resources :reservations, only: [ :destroy, :edit, :update, :index, :show]

  end

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
