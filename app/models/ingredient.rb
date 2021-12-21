class Ingredient < ApplicationRecord
  has_many :recipe_ings, dependent: :destroy
  has_many :recipes
  has_many :histories, dependent: :destroy

end
