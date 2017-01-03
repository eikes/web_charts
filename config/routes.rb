Rails.application.routes.draw do
  post 'image/create_image'
  get 'image/new'
  root 'image#new'

  resources :posts
end
