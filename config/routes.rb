Rails.application.routes.draw do
  get '/', to: 'site#index'
  resources :places
end
