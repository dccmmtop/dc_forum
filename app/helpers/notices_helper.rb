module NoticesHelper
  def notice_count
    Notice.count 
  end

  def to_me
    if current_user
      notices = Notice.where("to_user = ?",current_user.email)
      if notices.size > 0
        return notices.order(created_at: :desc).first
      end
    end
    return Notice.where(" to_user is null").order(created_at: :desc).first
  end
end
