Rails.application.routes.draw do
  get 'products/new'

  root :to => 'pages#home'

  get '/sign_in', :to => 'sessions#new'
  match '/sign_out', :to => 'sessions#destroy', via: [:delete]
  match '/sessions', :to => 'sessions#create', via: [:post]

  get '/cart', :to => 'pages#cart'

  get '/products/household', to: "products#household"
  get '/products/personal_care', to: "products#personalCare"
  get '/products/beverages', to: "products#beverages"
  get '/products/video_games', to: "products#videoGames"

  resources :products
  
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
