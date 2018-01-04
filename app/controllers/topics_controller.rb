class TopicsController < ApplicationController

  def index
    @topics=all_topics_by_time.page(params[:page]).per(10)
  end

  def show
    @topic=Topic.find(params[:id])
    @topic.update(read_count: @topic.read_count+1)
    @topic
  end

  def new
    if Limit.find_by("to_user = ? and (status = 0 or status = 2)",current_user.email)
      redirect_to root_url,alert: "你被限制不能发表文章,请于管理员联系!"
    end
    @topic=Topic.new
  end

  def create
    @topic=Topic.new(topics_params)
    @topic.user_id=current_user.id;
    if @topic.save
      @topic.save_tags
      redirect_to topic_url(@topic),notice: "发表成功!"
    else
    redirect_to new_topic_url,alert: "发表失败!" << @topic.errors.full_messages.to_s
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
    Tag.where("topic_id=?",params[:id]).each do |tag|
      tag.destroy
    end
    
  end

  def topics_params
    params.require(:topic).permit(:title,:body,:tag,:category_id)
  end

end