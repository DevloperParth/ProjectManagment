Rails.application.routes.draw do

  root 'employees#index'
   
  #root "users#index"

  devise_for :users
  
  resources  :job_details, :users, :employers, :employees

  namespace :admin do
    resources :admin
  end
  
  namespace :employee do
    resources :job_details
  end

  namespace :employer do
    resources :employers
  end  
  #root "users#index"
  
end
