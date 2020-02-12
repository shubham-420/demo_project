Rails.application.routes.draw do

  devise_for :users, controllers: { sessions: 'users/sessions' }
  # devise_for :users
  
  devise_scope :users do
    get '/users/sign_out' => 'devise/sessions#destroy'
  end
  resources :users
  get 'welcome/index'
  root 'welcome#index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
