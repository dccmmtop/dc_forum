class NoticesController < ApplicationController

  def index
    @notices = Notice.order(created_at: :desc).page(params[:page]).per(15)
  end

  def new
    @notice = Notice.new
  end

  def new_to
    @notice = Notice.new
  end

  def create
    @notice = Notice.new(noctice_params)
    if @notice.save
      redirect_to notices_url,notice: '发布成功!'

    else
      redirect_to notices_url,alert: '发布发布失败!'
    end
  end

  def edit
    @notice =  Notice.find(params[:id])
  end

  def update
    @notice =  Notice.find(params[:id])
    @notice.update(noctice_params)
    redirect_to notices_url,notice: '修改成功!'
  end

  def destroy
    Notice.find(params[:id]).destroy
    redirect_to notices_url,notice: '删除成功!'
  end

  def noctice_params
    params.require(:notice).permit(:content,:admin_id,:to_user)
  end
end
