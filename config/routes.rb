Rails.application.routes.draw do
  root to: 'tweets#index'
  resources :tweets, only: :index
  resources :schedules, except: [:show]
end
