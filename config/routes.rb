Rails.application.routes.draw do
  get 'data/create_datum'

  root 'charts#index'
  resources :charts
  get '/charts/download/:id', to: 'charts#download', as: 'chart_download'
end
