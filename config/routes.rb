Rails.application.routes.draw do
  scope "(:locale)", locale: /#{I18n.available_locales.join("|")}/ do
    resources :gatos
    devise_for :users
    root "home#index"
  end

  namespace :admin do
    get "/", to: "dashboard#index"
    resources :users, only: [ :index, :show, :edit, :update ]
    resources :gatos, only: [ :index, :show, :destroy ]
    resources :analytics, only: [ :index ] do
      collection do
        get "page_views"
        get "gato_popularity"
        get "user_activity"
        get "registration_stats"
        get "search_terms"
      end
    end
  end

  # Fallback route for root without locale
  get "", to: redirect("/#{I18n.default_locale}")
end
