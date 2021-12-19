class Recipe < ApplicationRecord


  belongs_to :user

  has_many :ingredints, dependent: :destroy
  has_many :favorites, dependent: :destroy
  has_many :recipe_ings

  attachment :image

  def favorited_by?(user)
    favorites.where(user_id: user.id).exists?
  end
end