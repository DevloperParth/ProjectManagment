Rails.application.routes.draw do
   
  root "job_details#index"

  devise_for :users
  
  resources  :job_details, :users, :employers, :employees

  namespace :admin do
    resources :admin
  end
  
  namespace :employee do
    resources :job_details
  end

  namespace :employer do
    resources :job_details
  end  
  #root "users#index"
  
end
