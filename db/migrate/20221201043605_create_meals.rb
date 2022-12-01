class CreateMeals < ActiveRecord::Migration[7.0]
  def change
    create_table :meals do |t|
      t.string :name
      t.float :price
      t.text :description
      t.text :photo
      t.integer :rating
      t.float :user_ratings_total
      t.belongs_to :restaurant, null: false, foreign_key: true
      t.timestamps
    end
  end
end
