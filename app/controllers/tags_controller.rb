class TagsController < ApplicationController
  def show
    @topics=[] 
    Topic.all.collect.each do |topic|
     @topics << topic if topic.tag && topic.tag.index(params[:name])
    end
    puts "================"
    @topics
    @tag=Tag.find_by(name:params[:name])
  end
end
