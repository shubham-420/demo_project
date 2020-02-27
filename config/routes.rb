Rails.application.routes.draw do
  resources :locations
  resources :addresses
  resources :orders
  resources :products
  
  get 'order/:id/checkout', to: 'orders#checkout', as: :checkouts
  get 'cart/index'
  # get 'product/get_subcategories_by_category'
  # get 'product/get_subcategories',to: 'products#get_subcategories'
  resources :products do
    member do
      get :get_subcategories, defaults: { format: "js" }
    end
  end


  # get 'orders/allorder'

  get 'buyers/index'
  get 'users/index'
  devise_for :users, controllers: { sessions: 'users/sessions' }
  devise_scope :users do
    get '/users/sign_out' => 'devise/sessions#destroy'
  end
  
  resources :welcome, only: [:index] do
    collection do
      get :search
    end
  end
  
  # get 'welcome/search/:search', to: 'welcome#search', as: :searchs
  get 'welcome/index'
  root 'welcome#index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
