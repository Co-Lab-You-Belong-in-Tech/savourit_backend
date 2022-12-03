class CreateCategoryMeals < ActiveRecord::Migration[7.0]
  def change
    create_table :category_meals do |t|
      t.belongs_to :category
      t.belongs_to :meal
      t.timestamps
    end
  end
end
