class Topic < ApplicationRecord
  belongs_to :user, inverse_of: :topics
end
