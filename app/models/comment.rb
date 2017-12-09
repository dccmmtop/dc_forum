class Comment < ApplicationRecord
  belongs_to :user,:topic
  has_many :replies
end
