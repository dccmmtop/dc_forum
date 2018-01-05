module LikesHelper

  def like_count(comment)
    Like.where("comment_id = ? ",comment.id).count
  end

  def is_like?(user,comment)
    return true if Like.find_by("comment_id = ? and user_id = ?" ,comment.id,user.id)
    return false
  end

  def i_like(user,comment)
    Like.create(comment_id:comment.id,user_id:user.id)
  end

  def dont_like(user,comment)
    if like = Like.find_by("comment_id = ? and user_id = ?" ,comment.id,user.id)
      like.destroy
    end
  end
end
