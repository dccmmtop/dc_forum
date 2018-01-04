class LimitsController < ApplicationController

  def create
    @limit = Limit.new(limit_params)
    respond_to do |format|
      p "-----"
       p params[:limit][:to_user]
        p User.find_by(email: params[:to_user])
      if User.find_by(email: params[:limit][:to_user]).nil?
        flash[:alert] = '提交失败! 没有这个用户'
      elsif @limit.save
       flash[:notice] = '提交成功!'
     else
       flash[:alert] = '提交失败! '+ @limit.errors.full_message.to_s
     end
     format.js{}
   end
 end

 def destroy
  Limit.find(params[:id]).destroy
  respond_to do |format|
    format.html { head :no_content }
  end
end


def limit_params
  params.require(:limit).permit(:admin_id,:to_user,:status)
end
end
