Cms9::Engine.routes.draw do
  mount Ckeditor::Engine => '/ckeditor'
  resources :post_definitions
  resources :post_fields
  resources :events
  resources :posts do
    resources :fields
  end

  root 'welcome#index'
end
