Rails.application.routes.draw do
  resources :post_definitions

  root 'welcome#index'
end
