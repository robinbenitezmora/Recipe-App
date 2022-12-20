Rails.application.routes.draw do
  get 'foods/index'
  get 'foods/show'
  resources :users
  resources :recipes
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
