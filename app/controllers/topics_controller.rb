class TopicsController < ApplicationController
  def index
    @topics=Topic.all.order(read_count: :desc)
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
      @topic.save_tags
      redirect_to topic_url(@topic),notice: "发表成功!"
    else
    redirect_to topic_url(@topic),alert: "发表失败!" << @topic.errors.full_messages
    end
  end

  def edit
    @topic=Topic.find(params[:id])
  end
  def update
    @topic=Topic.find(params[:id])
    if params[:tag] && params[:tag].chome.size==0
      params[:tag]=nil
    end
    if @topic.update(topics_params)
      @topic.save_tags 
      redirect_to topic_url(@topic),notice: "更新成功!"
    end
  end

  def destroy
    Topic.find(params[:id]).destroy
    
  end

  def topics_params
    params.require(:topic).permit(:title,:body,:tag,:category_id)
  end

end