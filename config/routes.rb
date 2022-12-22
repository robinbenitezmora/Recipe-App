Rails.application.routes.draw do
  devise_for :users
  root 'recipes#index'
  resources :users
  resources :recipes
  resources :foods
  resources :recipe_foods

  # Defines the routes for the inventory and inventory_foods controller
  resources :inventories, except: %i[update] do
    resources :inventory_foods, only: %i[new create destroy]
  end 
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
