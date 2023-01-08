class AddAllergenToIngredient < ActiveRecord::Migration[7.0]
  def change
    add_reference :ingredients, :allergen, foreign_key: true
  end
end
