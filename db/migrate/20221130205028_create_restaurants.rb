class CreateRestaurants < ActiveRecord::Migration[7.0]
  def change
    create_table :restaurants do |t|
      t.string :name, null: false
      t.string :address, null: false
      t.string :street_address, null: false
      t.string :city, null: false
      t.string :country, null: false
      t.string :postal_code,default: ''
      t.string :region, default: ''
      t.string :latitude, default: ''
      t.string :longitude, default: ''
      t.string :phone_number, default: ''
      t.string :currency_code, default: ''
    
      t.timestamps
    end
  end
end
