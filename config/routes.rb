Rails.application.routes.draw do
  devise_for :users
  root 'site#index'
  get '/', to: 'site#index', as: :home

  get  "/register", to: "register#new"
  post "/register", to: "register#create"

  post "/login", to: "session#create"
  delete "/logout", to: "session#destroy"

  resources :users, only: [:show, :edit, :update]
  
  resources :places
  get '/nearby_places', to: 'places#near'
  get '/search_places', to: 'places#search'
end
