Rails.application.routes.draw do
  namespace :api do
    post 'get_countries_by_ip/', to: 'ip_api#get_countries'
  end
end
