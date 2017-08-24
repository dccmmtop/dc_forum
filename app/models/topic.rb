class Topic < ApplicationRecord
  belongs_to :user, inverse_of: :topics
  belongs_to :category,counter_cache: true
  has_and_belongs_to_many :tags,counter_cache: true
  validates :title,:body,presence: true

  after_save :save_tags
  def save_tags
    self.tag.split(",").each do |tag|
      self.tags.create(name:tag)
    end
  end

end
