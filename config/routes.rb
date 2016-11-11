Rails.application.routes.draw do
  devise_for :customers


  root "products#index"
  resources :order_lines, only: [:create, :update, :destroy]
  resources :products
  resource :cart, only: [:show]
  get 'complete_order/:id'=> "orders#complete_order", as: :complete_order
  resources :orders
  get 'new-charge' => 'charges#new', as: :new_charge
  post 'new-charge' => 'charges#create', as: :new_payment
end
