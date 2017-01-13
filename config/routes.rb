Rails.application.routes.draw do
  get 'data/create_datum'

  root 'charts#new'
  resources :charts, except: [:destroy]
end
