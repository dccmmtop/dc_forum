class TopicsController < ApplicationController
  def index
    @topics=Topic.all
  end

  def show
    @topic=Topic.find(params[:id])
    @topic.update(read_count: @topic.read_count+1)
    @topic

    
  end

  def new
    @topic=Topic.new
  end

  def create
    @topic=Topic.new(topics_params)
    @topic.user_id=current_user.id;
    if @topic.save
      redirect_to topic_url(@topic),notice: "发表成功!"
    end
  end

  def edit
    @topic=Topic.find(params[:id])
  end
  def update
    @topic=Topic.find(params[:id])
    if @topic.update(topics_params)
      redirect_to topic_url(@topic),notice: "更新成功!"
    end
  end

  def topics_params
    params.require(:topic).permit(:title,:body)
  end

end