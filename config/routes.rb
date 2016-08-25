Rails.application.routes.draw do
  get 'products/new'

  root :to => 'pages#home'

  get '/sign_in', :to => 'sessions#new'
  match '/sign_out', :to => 'sessions#destroy', via: [:get]
  match '/sessions', :to => 'sessions#create', via: [:post]
  get '/cart', :to => 'pages#cart'
  match '/remove_from_cart', to: 'sessions#removeFromCart', via: [:post]
  match '/add_to_cart', :to => 'sessions#addToCart', via: [:post]
  get '/search', :to => 'products#search'

  get '/products/household', to: "products#household"
  get '/products/personal_care', to: "products#personalCare"
  get '/products/beverages', to: "products#beverages"
  get '/products/video_games', to: "products#videoGames"

  resources :products, only: [:create, :new]

  resources :orders, only: [ :create, :show]
  
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
