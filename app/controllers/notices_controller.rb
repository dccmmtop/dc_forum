class NoticesController < ApplicationController

  def index
    respond_to do |format|
      @notices = Notice.order(created_at: :desc)
      format.js{}
    end
  end

  def new
    @notice = Notice.new
  end

  def create
    @notice = Notice.new(noctice_params)
    respond_to do |format|
      if @notice.save
        flash[:notice] = '发布成功!'
      else
       flash[:alert] = '发布失败!'
     end
     format.js{}
   end
 end

 def edit
  @notice =  Notice.find(params[:id])
  respond_to do |format|
    format.js{}
  end
 end

 def destroy
  Notice.find(params[:id]).destroy
  respond_to do |format|
    format.html { head :no_content }
  end
end

def noctice_params
  params.require(:notice).permit(:content,:admin_id,:to_user)
end
end
