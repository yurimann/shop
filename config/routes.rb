Rails.application.routes.draw do
resources :products
resource :cart, only: [:show]
resources :order_items, only: [:create, :update, :destroy]
root to: "products#index"

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
