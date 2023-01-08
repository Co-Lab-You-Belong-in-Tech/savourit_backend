Rails.application.routes.draw do
  resources :allergens
  resources :category_ingredients
  resources :ingredients
  resources :avoid_foods
  resources :avoid_food_categories
  resources :hungers
  resources :categories
  
  root "dashboard#index"
  get '/meals', to: 'dashboard#meals'
  get '/categories_manage', to: 'categories#categories_manage', as: 'categories_manage'
  get '/categories_remove', to: 'categories#categories_remove', as: 'categories_remove'
  post '/merge_categories', to: 'categories#merge_categories', as: 'merge_categories'
  get '/remove_category_from_meal/:meal/:category', to: 'meals#remove_category_from_meal', as: 'remove_category_from_meal'


  resources :restaurants do
      resources :meals
  end
end
