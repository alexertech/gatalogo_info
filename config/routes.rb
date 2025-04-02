Rails.application.routes.draw do
  get "home/index"
  resources :gatos
  devise_for :users

  get 'home/index'
  root "home#index"
end
