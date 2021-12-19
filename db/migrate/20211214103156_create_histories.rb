class CreateHistories < ActiveRecord::Migration[5.2]
  def change
    create_table :histories do |t|
      t.integer :user_id
      t.integer :menu_id
      t.integer :recipe_id
      t.float :total_protein
      t.float :total_fat
      t.integer :total_cal
      t.float :total_carbon
      t.float :total_salt
      t.float :total_vit_b1
      t.float :total_vit_b2
      t.float :total_vit_c

      t.timestamps
    end
  end
end
