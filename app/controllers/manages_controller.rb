class ManagesController < ApplicationController
  def index
    @topics=all_topics_by_time
  end
end
