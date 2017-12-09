class FriendLinksController < ApplicationController

  def create
    @friend_link = FriendLink.new(name: params['name'],link: params['link'])
    @friend_link.user_id = current_user.id
    if @friend_link.save
      render :plain => "true"
    else
      render :plain => "false"
    end
  end

  def destroy
    FriendLink.find(params[:id]).destroy
    render :plain => "true"
  end

  def friend_link_params
    params.require().permit(:user_id,:name,:link)
    
  end
end
