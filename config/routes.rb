Rails.application.routes.draw do

  devise_for :users, controllers: {
    registrations: 'users/registrations',
    confirmations: 'users/confirmations',
    sessions: 'users/sessions',
    passwords: 'users/passwords'
  }

  root to: 'temples#index'
  resources :temples
  resources :temple_history_details
end

