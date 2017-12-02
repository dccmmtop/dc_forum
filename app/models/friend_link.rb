class FriendLink < ApplicationRecord
  belongs_to :use
  validates :name,presence: true,length: {maximum: 20,minimum: 1}

end
