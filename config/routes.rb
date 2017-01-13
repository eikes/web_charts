Rails.application.routes.draw do
  get 'data/create_datum'

  root 'charts#index'
  resources :charts, except: [:destroy]
end
