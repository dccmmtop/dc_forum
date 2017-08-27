class ManagesController < ApplicationController
  def index
    @topics=all_topics_by_time
  end

  def destroy
    Topic.find(params[:id]).destroy
    Tag.where("topic_id=?",params[:id]).each do |tag|
      tag.destroy
    end
    redirect_to manages_url,notice: "删除成功!"
    
  end
end
