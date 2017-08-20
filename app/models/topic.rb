class Topic < ApplicationRecord
  belongs_to :user, inverse_of: :topics
  validates :title,:body,presence: true
end
