json.extract! meal, :id, :name, :price, :description, :photo, :rating, :user_ratings_total, :restaurant_id,
              :created_at, :updated_at
json.url meal_url(meal, format: :json)
