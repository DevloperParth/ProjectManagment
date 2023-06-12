Rails.application.routes.draw do
  
  root "users#index"

  devise_for :users
  
  resources  :job_details, :users, :employers

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
