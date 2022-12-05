class AddHungerToCategory < ActiveRecord::Migration[7.0]
  def change
    add_reference :categories, :hunger, foreign_key: true
  end
end
