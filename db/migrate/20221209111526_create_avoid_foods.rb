class CreateAvoidFoods < ActiveRecord::Migration[7.0]
  def change
    create_table :avoid_foods do |t|
      t.string :name
      t.belongs_to :avoid_food_category, null: false, foreign_key: true

      t.timestamps
    end
  end
end
