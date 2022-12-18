class CreateIngredients < ActiveRecord::Migration[7.0]
  def change
    create_table :ingredients do |t|
      t.string :name
      t.belongs_to :category_ingredient, null: true, foreign_key: true
 
      t.timestamps
    end
  end
end
