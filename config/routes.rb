Rails.application.routes.draw do
root 'welcome#index'

resources :prescriptions
resources :drugs
resources :prescriptions_transactions
resources :ledger

end
