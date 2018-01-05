class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :topic

  has_many :replies
  has_many :likes
  

  validates :content,presence: true
end
