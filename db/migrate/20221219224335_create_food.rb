class CreateFood < ActiveRecord::Migration[7.0]
  def change
    create_table :foods do |t|
      t.string :name
      t.string :measurementunit
      t.integer :price

      t.timestamps
    end
  end
end
