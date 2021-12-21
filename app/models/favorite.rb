class Favorite < ApplicationRecord
  belongs_to :user
  belongs_to :recipe

  has_many :favorite_recipes, through: :favorites, source: 'recipe'

end
