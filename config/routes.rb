Rails.application.routes.draw do
  devise_for :customers


  root "products#index"
  resources :products, only: [:index]
  resource :cart, only: [:show]
  resources :order_lines, only: [:create, :update, :destroy]
  resources :products, only: [:index]
  resource :cart, only: [:show]

end
