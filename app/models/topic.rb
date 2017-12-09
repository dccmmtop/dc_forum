class Topic < ApplicationRecord
  belongs_to :user, inverse_of: :topics
  belongs_to :category,counter_cache: true
  has_many :comments
  validates :title,:body,presence: {message: "内容不能为空"}
  validates :title,length:{maximum: 50,message: "标题长度不能超多50个字符"}

  def save_tags
    self.tag.split(",").each do |tag|
      if !Tag.find_by("name=? and topic_id=?",tag,self.id)
        Tag.create(name:tag,topic_id: self.id)
      end
    end
  end
  def self.add_topic
    dir=Dir.open("./tmp/topic/")
    dir.each do |name|
      next if name=="." || name==".."
      path= "./tmp/topic/" << name
      puts path
      topic=File.open(path,"r")
      body=""
      title=""
      _tag=""
      categories=""
      date=""
      topic.each_line do |line|
        puts line[0..4]
        if line[0..4] == "title"
          title= line.split(":")[1] 
        elsif line[0..2] == "tag"
          _tag= line.split(":")[1]
        elsif line[0..3] == "date"
          date= line.split(":")[1]
        elsif line[0..9] == "categories"
          categories=line.split(":")[1]
        else
          body << line + "\n"
        end
      end
      categories='未分类' if categories.length==0
      topic=Topic.create(
        user_id: User.find_by(name: 'dccmmtop').id,
        title: title,
        tag: _tag,
        category_id: Category.find_by(name:categories).id,
        body: body
      )
      topic.save_tags
      FileUtils.cp path ,"../blog/"
      File.delete path
    end
  end
end
