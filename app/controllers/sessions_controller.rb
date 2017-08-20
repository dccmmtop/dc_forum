class SessionsController < ApplicationController

  def new
     
  end

  def create
    @user=User.find_by(email: params[:session][:name]) || User.find_by(name: params[:session][:name])
    if @user && @user.authenticate(params[:session][:password])
      log_in @user
      redirect_to root_url
    else
      render 'new',notice: @user.errors.full_messages
    end 
  end

  def destroy
    session.delete :user_id
    @current_user=nil
    redirect_to root_url
  end

end