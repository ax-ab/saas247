Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#index'

  resources :company_licenses, only: [:index, :show]
  get '/dashboard', to: 'company_licenses#dashboard'
  get '/usage', to: 'company_licenses#usage'
  namespace :api, defaults: { format: :json } do
    namespace :v1 do
      resources :events, only: [ :index ]
    end
  end
end
