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
    Notice.order(created_at: :desc).each do |notice|
      next if current_user && notice.to_user && notice.to_user != current_user.email
      return notice
    end
  end
end
