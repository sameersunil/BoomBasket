Rails.application.routes.draw do
  get 'products/new'

  root :to => 'pages#home'

  get '/sign_in', :to => 'pages#sign_in'
  get '/cart', :to => 'pages#cart'
  get '/products', to: "products#index"

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
