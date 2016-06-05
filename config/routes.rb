Rails.application.routes.draw do
  # Change the line below to handle every request through a subdomain
  #namespace :api, constraints: { subdomain: 'api' }, path: '/' do
  namespace :api, path: '/api' do
    api_version(:module => "V1", :header => {:name => "Accept",
                                             :value => "application/vnd.shepherd_app.com+json; version=1"},
                                             :defaults => {:format => :json}, :default => true) do
      
      resources :logs, only: [:index]
      resources :ground_stations, only: [:index] do
        resources :logs, only: [:create]
      end
    end
  end
end