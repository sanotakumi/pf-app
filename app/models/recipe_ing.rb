class RecipeIng < ApplicationRecord

  attribute :quantity, :integer,  default: '1'

  belongs_to :user
  belongs_to :ingredient
  belongs_to :recipe

  def sum_of_ing_cal
    ingredient.ing_cal * quantity
  end

  def sum_of_ing_protein
    ingredient.ing_protein * quantity
  end

  def sum_of_ing_fat
    ingredient.ing_fat * quantity
  end

  def sum_of_ing_carbon
    ingredient.ing_carbon * quantity
  end

  def sum_of_ing_salt
    ingredient.ing_salt * quantity
  end

  def sum_of_ing_vit_b1
    ingredient.ing_vit_b1 * quantity
  end

  def sum_of_ing_vit_b2
    ingredient.ing_vit_b2 * quantity
  end

  def sum_of_ing_vit_c
    ingredient.ing_vit_c * quantity
  end
end
