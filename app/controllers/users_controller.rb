class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy]

  # GET /users
  # GET /users.json
  def index
    @users = User.all
  end

  # GET /users/1
  # GET /users/1.json
  def show
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
      log_in(@user)
        #设置   默认的博客设置信息
        current_user.create_setting
   format.html {redirect_to root_url}
  else
    #   # format.html { render action: "new" }
    format.js{}
    #   # format.json { render json: @user.errors, status: :unprocessable_entity }
    #   # @user
    #   end
  end
    # 
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
      render  plain: "true"
    else 
      render :plain=>"false"
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def user_params
      params.require(:user).permit(:name, :email,:old_password,:password,:password_confirmation,:qq,:sex,:summary,:birthday,:address,:marital_status,:degree,:position,:tel,:nickname)
    end

  end

