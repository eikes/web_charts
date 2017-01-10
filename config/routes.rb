Rails.application.routes.draw do
  resources :images, only: [:new, :create]

  root 'charts#new'
  resources :charts, only: [:new, :create, :show]
end
