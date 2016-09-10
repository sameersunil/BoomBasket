Rails.application.routes.draw do
  root :to => 'pages#home'

  get '/sign_in', :to => 'sessions#new'
  match '/sign_out', :to => 'sessions#destroy', via: [:get]
  match '/sessions', :to => 'sessions#create', via: [:post]
  get '/cart', :to => 'pages#cart'
  match '/remove_from_cart', to: 'sessions#removeFromCart', via: [:post]
  match '/add_to_cart', :to => 'sessions#addToCart', via: [:post]
  get '/search', :to => 'products#search'
  
  match '/paginate', :to => 'products#paginate', via: [:post]

  resources :products, only: [:create, :new, :index]

  resources :orders, only: [ :create, :show, :index]
  
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
