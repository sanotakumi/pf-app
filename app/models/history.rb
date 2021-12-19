class History < ApplicationRecord
  belongs_to :user, dependent: :destroy

  belongs_to :menu, dependent: :destroy


end
