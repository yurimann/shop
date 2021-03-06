Rails.application.routes.draw do
  resources :users, only: [:new, :create]

resources :products
resource :cart, only: [:show]
resources :order_items, only: [:create, :update, :destroy]
root to: "products#index"

get '/checkout', to: 'carts#checkout'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
