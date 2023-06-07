Rails.application.routes.draw do
  
  root "employers#index"

  resources :employers
  devise_for :employers
  
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
