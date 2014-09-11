Rails.application.routes.draw do
root 'welcome#index'

resources :prescriptions
resources :drugs
resources :ledger
resources :ledger_prescriptions

resources :drugs do
  resources :prescriptions
end

resources :prescriptions do
  resources :drugs
end

end
