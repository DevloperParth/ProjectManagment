Rails.application.routes.draw do
  
  root "users#index"

  devise_for :users
  
  resources  :job_details, :users

  namespace :admin do
    resources :admin
  end
  namespace :employee do
    resources :users
  end
  #root "users#index"
  
end
