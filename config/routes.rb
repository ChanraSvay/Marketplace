Rails.application.routes.draw do
  get '/dashboard', to: 'dashboard#index', as: :dashboard
  get 'dashboard/products'

  resources :products

  devise_for :users
  
  root 'pages#home'

  post 'products/:id/order', to: 'products#place_order', as: 'place_order'

  post 'checkout/create' => 'checkout#create', as: 'checkout_create'

  get 'pages/success', to: 'pages#success', as: 'order_success'
  



  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
