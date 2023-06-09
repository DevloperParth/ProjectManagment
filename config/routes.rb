Rails.application.routes.draw do
  
  root "users#index"

  devise_for :users
  
  resources  :job_details, :users

  #root "users#index"
  
end
