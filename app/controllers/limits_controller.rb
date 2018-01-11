class LimitsController < ApplicationController
  before_action :require_login,:require_admin


  def new
    @limit = Limit.new(admin_id: current_user.id)
  end

  def index
    @limits = Limit.order(to_user: :asc).page(params[:page]).per(10)
    
  end

  def create
    @limit = Limit.new(limit_params)
    if User.find_by(email: params[:limit][:to_user]).nil?
      redirect_to limits_url,alert: '提交失败! 没有这个用户'
    elsif Limit.find_by("to_user =? and (status = ? or status = 2)",@limit.to_user,@limit.status)
      redirect_to limits_url,alert:('提交失败!此类限制已经存在')
    elsif @limit.save
     redirect_to limits_url,notic:'提交成功!'
    else
      p @limit.errors
     redirect_to limits_url,alert:('提交失败! '+ @limit.errors.full_message.to_s)
   end
 end

 def destroy
  Limit.find(params[:id]).destroy
   redirect_to limits_url,notic:' 成功!'

end


def limit_params
  params.require(:limit).permit(:admin_id,:to_user,:status)
end
end
