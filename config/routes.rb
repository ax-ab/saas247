Rails.application.routes.draw do
  devise_for :users
  root to: 'company_licenses#dashboard'

  resources :company_licenses, only: [:index, :show]
  get '/dashboard', to: 'company_licenses#dashboard'

end
