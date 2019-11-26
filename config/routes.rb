Rails.application.routes.draw do
  devise_for :users
  root to: 'company_licenses#dashboard'

  resources :company_licenses, only: [:index, :show]
  get '/dashboard', to: 'company_licenses#dashboard'

  resources :license_usages, only: [:create]
  get 'license_usages/new/:user_id', to: 'license_usages#new'

  namespace :api, defaults: { format: :json } do
    namespace :v1 do
      resources :events, only: [ :index ]
    end
  end
end
