Rails.application.routes.draw do
  get 'admin', to: 'admin#index', as: 'admin'
  controller :sessions do
    get 'login', to: 'sessions#new'
    post 'login', to: 'sessions#create'
    delete 'logout', to: 'sessions#destroy'
  end
  resources :users
  resources :orders
  root 'store#index', as: 'store_index'
  resources :line_items
  resources :carts
  resources :products do
    get :who_bought, on: :member
  end



  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
