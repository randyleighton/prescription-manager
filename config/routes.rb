Rails.application.routes.draw do
  devise_for :users, path_names: {sign_in: "login", sign_out: "logout"}

  devise_scope :user do 
    root to: 'welcome#index'
    match '/sessions/user', to: 'devise/sessions#create', via: :post
  end

  resources :users do
    resources :prescriptions do
      resources :drugs
    end
  end
  
 resources :drugs do
    resources :prescriptions
  end

  resources :prescriptions
  resources :sessions
  resources :ledger
  resources :ledger_prescriptions
  
end
