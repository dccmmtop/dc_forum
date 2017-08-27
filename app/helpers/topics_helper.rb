module TopicsHelper
  def sort_by_read_count
    @topics=Topic.all.order(read_count: :desc).limit(10)
  end

  def all_topics_by_time
    Topic.all.order(created_at: :desc)
  end
end
