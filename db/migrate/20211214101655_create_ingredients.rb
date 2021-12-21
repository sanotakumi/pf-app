class CreateIngredients < ActiveRecord::Migration[5.2]
  def change
    create_table :ingredients do |t|
      t.string :name
      t.float :ing_protein
      t.float :ing_fat
      t.integer :ing_cal
      t.float :ing_carbon
      t.float :ing_salt
      t.float :ing_vit_b1
      t.float :ing_vit_b2
      t.float :ing_vit_c
      t.string :image_id

      t.timestamps
    end
  end
end
