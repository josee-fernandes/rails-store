Rails.application.routes.draw do
  root to: 'products#index'

  get 'products/new', to: 'products#new'
end
