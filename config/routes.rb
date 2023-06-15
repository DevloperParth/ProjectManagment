Rails.application.routes.draw do
   
  root "users#index"

  devise_for :users
  
  resources  :job_details, :users, :employers, :employees

  namespace :admin do
    resources :admin
  end
  
  get '/job_details', to: 'job_details#index'
  resources :employee do
    resources :job_details, only: [:index]
  end

  resources :employer do
    resources :job_details
  end  
  #root "users#index"
  
end
