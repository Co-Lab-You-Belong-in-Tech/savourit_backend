class CreateAvoidFoodCategories < ActiveRecord::Migration[7.0]
  def change
    create_table :avoid_food_categories do |t|
      t.string :name

      t.timestamps
    end
  end
end
