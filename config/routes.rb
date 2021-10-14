Rails.application.routes.draw do

  root to: 'temples#index'
  resources :temples
  resources :temple_history_details
end

