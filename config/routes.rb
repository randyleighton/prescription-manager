Rails.application.routes.draw do
  root 'welcome#index'
  get 'signup', to: 'users#new', as: 'signup'
  get 'login', to: 'sessions#new', as: 'login'
  get 'logout', to: 'sessions#destroy', as: 'logout'

  resources :users
  resources :sessions
  resources :prescriptions
  resources :drugs
  resources :ledger
  resources :ledger_prescriptions
  
  resources :drugs do
    resources :prescriptions
  end
  resources :users do
    resources :prescriptions do
      resources :drugs
    end
  end
  
end
