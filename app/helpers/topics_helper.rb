module TopicsHelper
  def sort_by_read_count(user = nil)
    if user
      @topics=user.topics.order(read_count: :desc).limit(10)
    else
      @topics = Topic.order(read_count: :desc).limit(10)
    end
  end

  def all_topics_by_time
    Topic.all.order(created_at: :desc)
  end
end
