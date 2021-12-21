class UserInfo < ApplicationRecord
  belongs_to :user, dependent: :destroy
end
