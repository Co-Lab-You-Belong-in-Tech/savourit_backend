class CreateHungers < ActiveRecord::Migration[7.0]
  def change
    create_table :hungers do |t|
      t.string :value

      t.timestamps
    end
  end
end
