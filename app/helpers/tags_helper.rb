module TagsHelper
  def all_tags
    @tags=ActiveRecord::Base.connection.execute("select name,count(id)  from tags group by name  order by count(id)  desc  ")
  end
end
