class Menu < ApplicationRecord
  belongs_to :user
  has_many :recipes,through: :histries,source: :item
  has_many :histories, dependent: :destroy
end
