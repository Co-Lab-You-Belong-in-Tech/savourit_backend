class CreateRestaurants < ActiveRecord::Migration[7.0]
  def change
    create_table :restaurants do |t|
      t.string :name, default: ''
      t.string :description, default: ''
      t.string :location, default: ''
      t.float :location_lat, default: 0
      t.float :location_lng, default: 0
      t.float :user_ratings_total, default: 0
      t.string :opening_hours, default: ''
      t.integer :rating, default: 0
      t.string :payment, default: ''
      t.text :itinerary, default: ''
      t.text :image, default: ''

      t.timestamps
    end
  end
end
