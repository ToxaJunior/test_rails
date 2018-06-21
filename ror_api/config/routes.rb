Rails.application.routes.draw do

  root to: 'test2#index'

  devise_for :users

  get 'test2', to: 'test2#index'

  resources :roles
  resources :permissions

  namespace :api do
    post 'get_countries_by_ip/', to: 'ip_api#get_countries'
  end
end
