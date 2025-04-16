Rails.application.routes.draw do
  scope "(:locale)", locale: /#{I18n.available_locales.join("|")}/ do
    resources :gatos
    devise_for :users
    root "home#index"
  end
  
  # Fallback route for root without locale
  get '', to: redirect("/#{I18n.default_locale}")
end
