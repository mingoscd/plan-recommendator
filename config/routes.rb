Rails.application.routes.draw do
  get '/', to: 'site#index'

  get  "/register", to: "register#new"
  post "/register", to: "register#create"

  post "/login", to: "session#create"
  delete "/logout", to: "session#destroy"

  resources :users, only: [:show, :edit, :update]
  
  resources :places
  get '/search_places', to: 'places#search'
end
