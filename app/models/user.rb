class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :recipes, dependent: :destroy
  has_many :favorites, dependent: :destroy
  has_many :menus, dependent: :destroy
  has_many :histories, dependent: :destroy
  has_many :user_infos, dependent: :destroy
  has_many :recipe_ings, dependent: :destroy

  validates :name, presence: true
  validates :email, presence: true
  validates :birthday, presence: true

end
