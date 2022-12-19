class CreateRecipe < ActiveRecord::Migration[7.0]
  def change
    create_table :recipes do |t|
      t.string :name
      t.timestamp :preparationtime
      t.timestamp :cookingtime
      t.string :description
      t.string :public

      t.timestamps
    end
  end
end
