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
    @user = User.new(user_params)
    if  @user.save
       log_in(@user)
    else
      redirect_to new_user_url,alert: '注册失败' <<  @user.errors.full_messages.to_s
    end
  end

  # PATCH/PUT /users/1
  # PATCH/PUT /users/1.json
  def update
    if params[:user][:password].blank?
        params[:user].delete(:password) 
        params[:user].delete(:password_confirmation) 
        puts "============================================================================"
  end
  if @user.update_attributes(params[:user].permit!)
      redirect_to edit_user_url(@user) ,notice: @user.errors.full_messages.to_s
    else
      redirect_to edit_user_url(@user) ,notice: @user.errors.full_messages.to_s

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

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def user_params
      params.require(:user).permit(:name, :email,:password,:password_confirmation,:qq,:sex,:summary,:birthday,:address,:marital_status,:degree,:position,:tel)
    end

  end

