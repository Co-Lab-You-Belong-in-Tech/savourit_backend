class CreateRestaurants < ActiveRecord::Migration[7.0]
  def change
    create_table :restaurants do |t|
      t.string :name
      t.string :description
      t.string :location
      t.float :location_lat
      t.float :location_lng
      t.float :user_ratings_total
      t.string :opening_hours
      t.integer :rating
      t.string :payment
      t.text :itinerary
      t.text :image

      t.timestamps
    end
  end
end
