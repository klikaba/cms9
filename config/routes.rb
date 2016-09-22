Cms9::Engine.routes.draw do
  resources :post_definitions
  resources :post_fields
  resources :posts do
    resources :fields
  end

  root 'welcome#index'
end
