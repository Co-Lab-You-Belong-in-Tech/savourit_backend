class CreateRestaurants < ActiveRecord::Migration[7.0]
  def change
    create_table :restaurants do |t|
      t.string :name, default: ''
      t.string :description, default: ''
      t.string :location, default: ''
      t.string :location_lat, default: ''
      t.string :location_lng, default: ''
      t.string :user_ratings_total, default: ''
      t.string :opening_hours, default: ''
      t.string :rating, default: ''
      t.string :payment, default: ''
      t.text :itinerary, default: ''
      t.text :image, default: ''

      t.timestamps
    end
  end
end
