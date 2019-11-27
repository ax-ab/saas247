Rails.application.routes.draw do
  get 'errors/show'
  devise_for :users
  root to: 'pages#index'

  resources :company_licenses, only: [:index, :show]
  get '/dashboard', to: 'company_licenses#dashboard'
  get '/usage', to: 'company_licenses#usage'

  resources :license_usages, only: [:create]
  # post 'usage', to: 'license_usages#create'
  get 'usage/new/:user_id', to: 'license_usages#new', as: 'new_survey'
  get 'usage/survey/:user_id', to: 'license_usages#survey_user', as: 'survey_user'
  get 'usage/survey_all', to: 'license_usages#survey_all', as: 'survey_all'
  get 'usage/survey_missing', to: 'license_usages#survey_missing', as: 'survey_missing'

  mount LetterOpenerWeb::Engine, at: "/letter_opener"
  # %w( 404 422 500 ).each do |code|
  #   get code, controller: :error, action: :show, code: code
  # end

  get '/404', to: 'errors#not_found'
  get '/422', to: 'errors#unacceptable'
  get '/500', to: 'errors#internal_error'

  namespace :api, defaults: { format: :json } do
    namespace :v1 do
      resources :events, only: [ :index ]
    end
  end
end
