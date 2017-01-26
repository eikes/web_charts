Rails.application.routes.draw do
  get 'data/create_datum'
  get 'chart/render_image/:id', to: 'charts#render_image', as: 'chart_render_image'


  root 'charts#index'
  resources :charts
  get '/charts/download/:id', to: 'charts#download', as: 'chart_download'
end
