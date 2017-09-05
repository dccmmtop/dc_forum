class TagsController < ApplicationController
  def show
    @topics=[] 
    Topic.all.collect.each do |topic|
     @topics << topic if topic.tag && topic.tag.index(params[:name])
    end
    @topics=Kaminari.paginate_array(@topics).page(params[:page]).per(10)
    @tag=Tag.find_by(name:params[:name])
  end
end
