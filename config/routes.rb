Rails.application.routes.draw do
  resources :categories
  resources :items
  get 'sessions/new'

  get 'users/new'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'static_pages#home'
  
  get 'category/:title', to: 'static_pages#category'
  
  get  '/help',    to: 'static_pages#help'
  get  '/about',   to: 'static_pages#about'
  get  '/contact', to: 'static_pages#contact'
  get  '/signup',  to: 'users#new'
  post '/signup',  to: 'users#create'
  get    '/login',   to: 'sessions#new'
  post   '/login',   to: 'sessions#create'
  delete '/logout',  to: 'sessions#destroy'
  
  get '/cart', to: 'cart#index'
  get '/cart/:id', to: 'cart#add'
  get '/clearcart' => 'cart#clear'
  get '/cart/remove/:id' => 'cart#remove'
  get '/cart/increase/:id' => 'cart#increase'
  get '/cart/decrease/:id' => 'cart#decrease'
  resources :users
  resources :account_activations, only: [:edit]
  
end
