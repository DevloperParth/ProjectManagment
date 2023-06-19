Rails.application.routes.draw do
   
  root "users#welcome"

  devise_for :users
  
  resources  :job_details, :users, :employers, :employees, :applicants

  namespace :admin do
    resources :admin
  end
  
  
  resources :employee do
    get 'show_all_jobs', to: 'job_details#show_all_jobs'
    resources :job_details, only: [:index]
  end


  resources :employer do
    resources :job_details
  end  

  # resources :applicants do
  #   resources :job_details
  # end  
  
end
