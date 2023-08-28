Rails.application.routes.draw do
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "articles#index"
  resources :users, only: [:show, :edit, :update, :destroy] do
    resources :reminders, only: [:new, :create]
  end
end
