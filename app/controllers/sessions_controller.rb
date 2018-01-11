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

  def forget_password
    
  end

  def send_email
    p params
    email = params[:email]
    user = User.find_by(email: email)
    unless user 
      redirect_to forget_password_url,alert:'没有这个用户'
    else
      time = Time.now.to_i
      digest = Digest::MD5.hexdigest("#{email}-#{time}")
      url = update_password_url << "?email=#{email}&digest=#{digest}&time=#{time}"
      if hu = Session.find_by(user_id:user.id)
        hu.destroy
      end
      Session.create(user_id:user.id,digest: digest)
      p url
      SendMail.new.send_email(email,"修改密码","#{url}\n,点击链接修改密码")
      redirect_to forget_password_url,notice:'邮件已发送，检查邮箱，请尽快更改密码'
    end
  end

  def update_password
    digest = Digest::MD5.hexdigest("#{params[:email]}-#{params[:time]}")
    if digest == params[:digest] && Session.find_by(digest:digest) && User.find_by(email: params[:email])
      if Time.now - Time.at(params[:time].to_i) < 1800
        @user = User.find_by(email: params[:email])
      else
        redirect_to forget_password_url,alert: '链接已经失效，请重新操作'
      end
    else 
      redirect_to not_found_url
    end
  end



  def destroy
    session.delete :user_id
    @current_user=nil
    redirect_to root_url
  end

end
