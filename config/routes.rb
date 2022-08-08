Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  resources :superpowers do
<<<<<<< HEAD
    resources :reservations, only: [ :new, :create, :show] do
=======
    resources :reservations, only: [ :new, :create, :edit, :update ] do
>>>>>>> fa644fda96df1a5263f6720f7113139712ec1c48
      resources :reviews, only: [:create, :index, :show]
    end
    resources :reservations, only: [ :destroy, :edit, :update, :index, :show]
  end
<<<<<<< HEAD
  resources :reservations, only: [ :destroy, :edit, :update, :index ]
=======
end

>>>>>>> fa644fda96df1a5263f6720f7113139712ec1c48


  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
