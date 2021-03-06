class UsersController < ApplicationController
  before_action :require_login,:set_user, only: [:show, :edit,:update, :destroy]
  before_action :require_admin ,only:[:destroy]

  # GET /users
  # GET /users.json
  def index
    @users = User.order(name: :asc)
  end

  # GET /users/1
  # GET /users/1.json
  def show
    @user=User.find(params[:id])
  end

  # GET /users/new
  def new
    @user = User.new
  end

  # GET /users/1/edit
  def edit
    @user=User.find(params[:id])
  end

  # POST /users
  # POST /users.json
  def create
    respond_to do |format|
      @user = User.new(user_params)
      # @user.save
      if @user.save
        if verify_rucaptcha
          log_in(@user)
          #设置   默认的博客设置信息
          current_user.create_setting
          format.html {redirect_to root_url}
        else
          @user.errors.messages[:code]=["验证码错误"]
          @user.destroy
          format.js{}
        end
      else
       format.js{}
      end
    end
  end

  # PATCH/PUT /users/1
  # PATCH/PUT /users/1.json
  def update
    #允许不更改密码,只更改其他信息
    if (!params[:old_password].blank? && !params[:user][:password].blank? && @user.authenticate(params[:old_password]) ) || (params[:old_password].blank?  && params[:user][:password].blank?)
      puts params[:old_password]
      if @user.update(user_params)
        redirect_to edit_user_url(@user) ,notice: "信息修改成功"
      else
        redirect_to edit_user_url(@user) ,alert: @user.errors.full_messages.to_s
      end
    else
     redirect_to edit_user_url(@user) ,alert: "密码错误"
   end
 end

  def update_password_from_forget
    @user = User.find(params[:user][:id])
    if @user.update(user_params)
      redirect_to login_url,notice:'密码修改成功，请重新登录'
    else
      redirect_to params[:up_url],alert:'密码修改失败' << @user.errors.full_messages.to_s
    end
  end

  # DELETE /users/1
  # DELETE /users/1.json
  def destroy
    @user.destroy
    respond_to do |format|
      format.html { redirect_to users_url, notice: 'User was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def verify_rucaptcha
    if verify_rucaptcha?(params[:_rucaptcha])
      return true
    else 
      return false
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def user_params
      params.require(:user).permit(:id,:name, :email,:old_password,:password,:password_confirmation,:qq,:sex,:summary,:birthday,:address,:marital_status,:degree,:position,:tel,:nickname ,:avatar,:up_url)
    end

  end

