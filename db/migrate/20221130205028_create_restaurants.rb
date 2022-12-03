class CreateRestaurants < ActiveRecord::Migration[7.0]
  def change
    create_table :restaurants do |t|
      t.string :name, null: false
      t.string :address, null: false
      t.string :street_address, null: false
      t.string :city, null: false
      t.string :country, null: false
      t.string :postal_code
      t.string :region
      t.string :latitude
      t.string :longitude
      t.string :phone_number
      t.string :currency_code
    
      t.timestamps
    end
  end
end
