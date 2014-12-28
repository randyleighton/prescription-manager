Rails.application.routes.draw do
  devise_for :users, path_names: {sign_in: "login", sign_out: "logout"}

  devise_scope :user do 
    root to: 'welcome#index'
    match '/sessions/user', to: 'devise/sessions#create', via: :post
  end

  resources :prescriptions do
    resources :fillings
  end
  resources :fillings, only: :index
  resources :drugs
  
end
