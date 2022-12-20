Rails.application.routes.draw do
  get 'recipes/index'
  get 'recipes/show'
  resources :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
