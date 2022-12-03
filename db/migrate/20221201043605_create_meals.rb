class CreateMeals < ActiveRecord::Migration[7.0]
  def change
    create_table :meals do |t|
      t.string :title, null: false
      t.float :price, null: false
      t.text :description
      t.text :image_url
      t.string :uber_url
      t.boolean :desactivate, default: false
      t.belongs_to :restaurant, null: false, foreign_key: true
      t.timestamps
    end
  end
end
