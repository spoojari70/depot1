Rails.application.routes.draw do
  devise_for :devise_users
  get 'admin' => 'admin#index'
  controller :sessions do
    get 'login' => :new
    post 'login' => :create
    delete 'logout' => :destroy
  end

  get 'sessions/create'
  get 'sessions/destroy'

  resources :products do
    resource :wishlists, only: [:create, :destroy]
  end

  resources :users
  resources :products do
    get :who_bought, on: :member
  end
  get '/wishlist', to: 'wishlists#show', as: 'wishlist'

  resources :support_requests, only: [ :index, :update ]


  post '/wishlists/add_to_wishlist/:product_id',
    to: 'wishlists#add_to_wishlist', as: 'add_to_wishlist'


  scope '(:locale)' do
    resources :orders
    resources :line_items
    resources :carts
    root 'store#index', as: 'store_index'
  end
end
