class CreateMeals < ActiveRecord::Migration[7.0]
  def change
    create_table :meals do |t|
      t.string :name, default: ''
      t.string :price, default: ''
      t.text :description, default: ''
      t.text :photo, default: ''
      t.string :rating, default: ''
      t.string :user_ratings_total, default: ''
      t.belongs_to :restaurant, null: false, foreign_key: true
      t.timestamps
    end
  end
end
