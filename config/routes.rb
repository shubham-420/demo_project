Rails.application.routes.draw do
  resources :locations
  resources :addresses
  get 'order/:id/checkout', to: 'orders#checkout', as: :checkouts
  get 'cart/index'
  get 'orders/allorder'

  # get 'order_now(/:id)', to: 'order#order_now', as: :order
  resources :orders
  resources :carts
  get 'buyers/index'
  get 'users/index'
  resources :products
  devise_for :users, controllers: { sessions: 'users/sessions' }
  devise_scope :users do
    get '/users/sign_out' => 'devise/sessions#destroy'
  end
  resources :users
  get 'welcome/index'
  root 'welcome#index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
