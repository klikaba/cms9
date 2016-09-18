Rails.application.routes.draw do
  resources :post_definitions
  resources :post_fields

  root 'welcome#index'
end