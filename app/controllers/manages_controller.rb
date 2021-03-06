class ManagesController < ApplicationController
  def index
    @topics=current_user.topics.page(params[:page]).per(10)
  end

  def destroy
    Topic.find(params[:id]).destroy
    Tag.where("topic_id=?",params[:id]).each do |tag|
      tag.destroy
    end
    redirect_to manages_url,notice: "删除成功!"
  end
end
