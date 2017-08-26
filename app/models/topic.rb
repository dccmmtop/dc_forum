class Topic < ApplicationRecord
  belongs_to :user, inverse_of: :topics
  belongs_to :category,counter_cache: true
  has_many   :tags,through: :tags_topics
  validates :title,:body,presence: true

  def save_tags
    
    self.tag.split(",").each do |tag|
      if !Tag.find_by("name=? and topic_id=?",tag,self.id)
        Tag.create(name:tag,topic_id: self.id)
      end
  end

end
end
