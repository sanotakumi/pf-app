class Recipe < ApplicationRecord

  belongs_to :user

  has_many :menus, dependent: :destroy
  has_many :favorites, dependent: :destroy
  has_many :recipe_ings, dependent: :destroy
  has_many :ingredints, through: :recipe_ings, source: 'Ingredient'

  has_many :favorite_users, through: :favorites, source: 'User'

  attachment :image

  def favorited_by?(user)
    favorites.where(user_id: user.id).exists?
  end
end