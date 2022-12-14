class CreateUbers < ActiveRecord::Migration[7.0]
  def change
    create_table :ubers do |t|
      t.string :uuid, null: false
      t.string :url, null: false
      t.string :slug
      t.string :city_slug
      t.integer :city_id
      t.boolean :delivery
      t.boolean :pickup
      t.float :rating_value
      t.integer :rating_count
      t.string :time_delivery
      t.belongs_to :restaurant, null: false, foreign_key: true

      t.timestamps
    end
  end
end
