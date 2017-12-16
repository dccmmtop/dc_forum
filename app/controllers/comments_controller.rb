class CommentsController < ApplicationController

  def create
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
  private
  def comment_params
    params.require(:comment).permit(:user_id,:topic_id,:content)

  end
end
