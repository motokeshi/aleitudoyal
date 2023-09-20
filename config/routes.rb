Rails.application.routes.draw do
  devise_for :users, controllers: {
    registrations: "users/registrations"
  }
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "users#index"
  resources :users, only: [:index, :show, :update, :destroy]
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
    member do
      get 'search'
      post'relation'
      delete 'cancellation'
    end
  end
end
