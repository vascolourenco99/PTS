Rails.application.routes.draw do
  devise_for :users
  root to: "events#index"

  resources :events do 
    resources :races
  end

  resources :review, only: [:show, :edit, :update, :destroy]

  resources :posts
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
