Rails.application.routes.draw do
  get 'recipe_foods/index'
  get 'recipe_foods/show'
  get 'recipe_foods/new'
  get 'recipe_foods/edit'
  get 'recipe_foods/create'
  get 'recipe_foods/update'
  get 'recipe_foods/destroy'
  resources :users
  resources :recipes
  resources :foods
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
