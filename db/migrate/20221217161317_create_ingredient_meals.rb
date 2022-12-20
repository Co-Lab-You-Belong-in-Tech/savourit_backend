class CreateIngredientMeals < ActiveRecord::Migration[7.0]
  def change
    create_table :ingredient_meals do |t|
      t.belongs_to :meal
      t.belongs_to :ingredient
      t.timestamps
    end
  end
end