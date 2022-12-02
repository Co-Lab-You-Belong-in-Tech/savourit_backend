class CreateImagers < ActiveRecord::Migration[7.0]
  def change
    create_table :imagers do |t|
      t.string :link
      t.belongs_to :restaurant, null: false, foreign_key: true

      t.timestamps
    end
  end
end
