Rails.application.routes.draw do
  resources :categories
  root "dashboard#index"

  resources :restaurants do
      resources :meals
  end
end
