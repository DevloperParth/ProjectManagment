Rails.application.routes.draw do
   

  root "users#welcome"

  devise_for :users
  
  resources  :job_details, :users, :employers, :employees, :applicants

  namespace :admin do
    resources :admin
  end
  
  
  # resources :job_detail do
  #   resources :employees
  # end

  resources :job_details do
    resources :job_applications do
      member do
        get :accept
        get :reject
      end  
    end  
  end

  

  
  

  resources :employer do
    resources :job_details
  end  

  # resources :applicants do
  #   resources :job_details
  # end  
  
end
