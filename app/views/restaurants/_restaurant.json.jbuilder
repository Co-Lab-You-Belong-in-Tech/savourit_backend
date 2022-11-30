json.extract! restaurant, :id, :name, :description, :location, :location_lat, :location_lng, :user_ratings_total,
              :opening_hours, :rating, :payment, :itinerary, :image, :created_at, :updated_at
json.url restaurant_url(restaurant, format: :json)
