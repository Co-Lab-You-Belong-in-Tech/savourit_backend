Rails.application.routes.draw do
  #resources :categories
  root "dashboard#index"
  get '/meals', to: 'dashboard#meals'
  get '/categories', to: 'dashboard#categories'


  resources :restaurants do
      resources :meals
  end
end
