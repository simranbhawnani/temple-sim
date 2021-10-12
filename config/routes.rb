Rails.application.routes.draw do

  root to: 'temples#index'
  resources :temples
end

