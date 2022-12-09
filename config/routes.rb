Rails.application.routes.draw do
  resources :avoid_foods
  resources :avoid_food_categories
  resources :hungers
  #resources :categories
  root "dashboard#index"
  get '/meals', to: 'dashboard#meals'
  get '/categories', to: 'dashboard#categories'


  resources :restaurants do
      resources :meals
  end
end
