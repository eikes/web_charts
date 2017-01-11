Rails.application.routes.draw do
  get 'data/create_datum'

  root 'charts#new'
  resources :charts, only: [:new, :create, :edit, :update, :show]
end
