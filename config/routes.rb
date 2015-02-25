Rails.application.routes.draw do
  devise_for :users
  root 'site#index'
  get '/', to: 'site#index', as: :home

  get  "/register", to: "register#new"
  post "/register", to: "register#create"

  get '/suggest', to: 'suggests#index'
  post '/suggest', to: 'suggests#search'

  resources :users, only: [:show, :edit, :update]
  
  resources :places
  get '/nearby_places', to: 'places#near'
  get '/search_places', to: 'places#search'

  # API Routes
  namespace :api do
    namespace :v1 do
      get '/near', to: "places#near"
    end
  end

end
