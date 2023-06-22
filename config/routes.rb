Rails.application.routes.draw do
   

  root "users#welcome"

  devise_for :users
  
  resources  :job_details, :users, :employers, :employees, :applicants

  namespace :admin do
    resources :admin
  end
  
  
  resources :job_details do
    get '/job_details/:id', to: 'job_details#show'
    resources :employees
  end

  resources :job_details do
    member do
      get 'applicant_count'
      get 'accept'
      get 'reject'
    end  
  end  

  

  resources :employer do
    resources :job_details
  end  

  # resources :applicants do
  #   resources :job_details
  # end  
  
end
