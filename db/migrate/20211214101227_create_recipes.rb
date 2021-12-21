class CreateRecipes < ActiveRecord::Migration[5.2]
  def change
    create_table :recipes do |t|
      t.integer :user_id
      t.integer :recipe_ing_id
      t.integer :cal
      t.float :protein
      t.float :fat
      t.float :carbon
      t.float :salt
      t.float :vit_b1
      t.float :vit_b2
      t.float :vit_c
      t.string :name
      t.string :image_id
      t.text :explanation
      t.integer :ing_quantity

      t.timestamps
    end
  end
end
