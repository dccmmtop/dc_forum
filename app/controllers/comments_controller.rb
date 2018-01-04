class CommentsController < ApplicationController

  def create
    if Limit.find_by("to_user =?  and (status = 1 or status =2)",current_user.email)
      redirect_to topic_url(params[:comment][:topic_id]),alert:"你被限制不能评论,请与管理员联系!"

    else
    @comment = Comment.new(comment_params)
    respond_to do |format|
      if @comment.save
       flash[:notice] = '回复成功!'
      else
       flash[:alert] = '回复失败!'
      end
      flash.each do |k,v|
        p "#{k}---#{v}"
      end
      format.js{} 
    end
  end
  end

  def edit
    comment = Comment.find(params[:id])
    comment.update(like_counts: comment.like_counts.to_i + 1)
    render :plain => (comment.like_counts).to_s
  end
  private
  def comment_params
    params.require(:comment).permit(:id,:user_id,:topic_id,:content,:to_comment_id)

  end
end
