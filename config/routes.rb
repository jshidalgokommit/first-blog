Rails.application.routes.draw do

  # authentication routes
  devise_for :users, sign_out_via: [:get, :post]

  # Defines the root path route ("/")
  root "articles#index"

  # resources articles
  resources :articles do
    resources :comments
  end
end

