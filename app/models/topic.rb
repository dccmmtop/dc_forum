class Topic < ApplicationRecord
  belongs_to :user, inverse_of: :topics
  belongs_to :category,counter_cache: true
  has_and_belongs_to_many :tags
  validates :title,:body,presence: true
end
