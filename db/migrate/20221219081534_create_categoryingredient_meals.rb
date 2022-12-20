class CreateCategoryingredientMeals < ActiveRecord::Migration[7.0]
  def change
    create_table :category_ingredient_meals do |t|
      t.belongs_to :meal, null: false, foreign_key: true
      t.belongs_to :category_ingredient, null: false, foreign_key: true

      t.timestamps
    end
  end
end
