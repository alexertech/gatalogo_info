Rails.application.routes.draw do
  resources :gatos
  devise_for :users

  root "cats#index"
end
