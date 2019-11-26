Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#index'

  resources :company_licenses, only: [:index, :show]
  get '/dashboard', to: 'company_licenses#dashboard'
  get '/usage', to: 'company_licenses#usage'

  resources :license_usages, only: [:create]
  # post 'usage', to: 'license_usages#create'
  get 'usage/new/:user_id', to: 'license_usages#new', as: 'new_survey'
  get 'usage/survey/:user_id', to: 'license_usages#user_survey', as: 'user_survey'
  get 'usage/survey', to: 'license_usages#all_survey', as: 'all_survey'

  namespace :api, defaults: { format: :json } do
    namespace :v1 do
      resources :events, only: [ :index ]
    end
  end
end
