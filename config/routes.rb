Rails.application.routes.draw do
  post 'image/create_image'
  get 'image/new'

  root 'charts#new'
  resources :charts, only: [:new, :create]
end
