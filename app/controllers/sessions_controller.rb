class SessionsController < ApplicationController

  def new
     
  end

  def create
    @user=User.find_by(email: params[:session][:name]) || User.find_by(name: params[:session][:name])
    if @user && @user.authenticate(params[:session][:password])
      log_in @user
      redirect_to root_url
    else
      redirect_to login_url,alert:'用户名或者密码错误'
    end 
  end

  def destroy
    session.delete :user_id
    @current_user=nil
    redirect_to root_url
  end

end