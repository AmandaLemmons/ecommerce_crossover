Rails.application.routes.draw do
  devise_for :customers

  resources :orders
  resources :order_lines, only: [:new, :create, :update, :destroy]
  resources :products
  resource :cart, only: [:show]

  get 'new-charge/:order_id/:customer_id' => 'charges#new', as: :new_charge
  post 'new-charge/:order_id/:customer_id' => 'charges#create', as: :new_payment
end
