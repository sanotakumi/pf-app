class Menu < ApplicationRecord

  attribute :quantity, :integer,  default: '1'

  belongs_to :user
  belongs_to :recipe

end
