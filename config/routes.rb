Rails.application.routes.draw do
  devise_for :users
  get 'welcome/index'

  resources :products, :path => "/admin/dashboard/products"
  resources :brands, :path => "/admin/dashboard/brands"
  resources :categories, :path => "/admin/dashboard/categories"

  root 'welcome#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
