Rails.application.routes.draw do
  devise_for :users
  root 'recipes#index'
  resources :users
  resources :recipes
  resources :foods
  resources :recipe_foods
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
