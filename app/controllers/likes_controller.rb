class LikesController < ApplicationController

  def like_or_dont_like
    user = User.find(params[:user_id])
    comment = Comment.find(params[:comment_id])
    if is_like?(user,comment)
      dont_like(user,comment)
      render plain: "cancel-#{like_count(comment)}"
    else
      i_like(user,comment)
      render plain: "add-#{like_count(comment)}"
    end
  end
end
