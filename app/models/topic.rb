class Topic < ApplicationRecord
  belongs_to :user, inverse_of: :topics
  belongs_to :category,counter_cache: true
  validates :title,:body,presence: {message: "内容不能为空"}
  validates :title,length:{maximum: 50,message: "标题长度不能超多50个字符"}

  def save_tags
    self.tag.split(",").each do |tag|
      if !Tag.find_by("name=? and topic_id=?",tag,self.id)
        Tag.create(name:tag,topic_id: self.id)
      end
    end
  end
end
