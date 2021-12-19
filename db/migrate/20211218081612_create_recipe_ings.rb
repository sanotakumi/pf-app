class CreateRecipeIngs < ActiveRecord::Migration[5.2]
  def change
    create_table :recipe_ings do |t|
      t.integer :ingredient_id
      t.integer :user_id
      t.integer :recipe_id
      t.integer :quantity

      t.timestamps
    end
  end
end
