Rails.application.routes.draw do
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "articles#index"
  resources :users, only: [:show, :edit, :update, :destroy]
  resources :reminders do
    resources :records, only: [:create, :edit, :update, :destroy]
    member do
      get 'search'
      post 'relation'
      delete 'cancellation'
    end
  end
  resources :articles do
    resources :posts
    resources :comments, only: [:create, :destroy]
  end
end
