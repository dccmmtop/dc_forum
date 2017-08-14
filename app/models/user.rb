class User < ApplicationRecord
  has_many :topics, dependent: :destroy
end
