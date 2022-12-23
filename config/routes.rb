Rails.application.routes.draw do
  devise_for :users

  root "shopping_list#index"
  resources :users, only: [:index] do
    resources :recipes
    resources :inventories
  end

  resources :shopping_list, only: [:index, :show]

  get 'inventory_foods/:id/new', to: 'inventory_foods#new'
  delete 'inventory_foods/:id/destroy/:food_id', to: 'inventory_foods#destroy'
  post 'inventory_foods/:id/create', to: 'inventory_foods#create'
  resources :foods, only:[:index,:new,:create,:destroy]

  get 'recipe_foods/:id/new', to: 'recipe_foods#new'
  delete 'recipe_foods/:id/destroy/:food_id', to: 'recipe_foods#destroy'
  post 'recipe_foods/:id/create', to: 'recipe_foods#create'

  devise_scope  :user do
    get 'users/sign_out' => 'devise/sessions#destroy'
  end
end
