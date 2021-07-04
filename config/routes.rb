Rails.application.routes.draw do
  get 'static_pages/home'
  get 'static_pages/help'
  root 'tweets#index'
  get 'tweets/index'
  resources :tweets, only: :index
end
