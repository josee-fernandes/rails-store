Rails.application.routes.draw do
  root to: 'products#index'

  resources :products, only: [:new, :create, :destroy]

  get 'products/search', to: 'products#search', as: :search_product
end
