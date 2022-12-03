json.extract! restaurant, :id, :name, :address, :street_address, :city, :country, :postal_code,
              :region, :latitude, :longitude, :currency_code, :phone_number, :created_at, :updated_at
json.url restaurant_url(restaurant, format: :json)
