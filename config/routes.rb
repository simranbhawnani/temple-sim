Rails.application.routes.draw do

  root to: 'temples#index'
  resources :temples
  resources :temple_history_details
  resources :offline_city_centres
  resources :worships
end

