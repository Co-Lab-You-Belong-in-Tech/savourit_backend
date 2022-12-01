Rails.application.routes.draw do
  root "dashboard#index"

  resources :restaurants do
      resources :meals
  end
end
