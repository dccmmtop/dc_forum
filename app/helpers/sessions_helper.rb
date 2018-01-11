module SessionsHelper
  class SendMail
    ##初始化邮件配置,利用sendcloud发送邮件。目前每天限额10条
    def initialize
      #邮件普通发送
      @send_mail = "http://api.sendcloud.net/apiv2/mail/send"
      #邮件模板发送
      @send_template = "http://api.sendcloud.net/apiv2/mail/sendtemplate"

      #邮件发送api_user
      @api_user = 'nut403_test_tVeipo'
      #邮件发送api_key
      @api_key = 'eNFPDGMZxVpxZHf0'
    end

    ##发送邮件，默认
    def send_email(to_mail='727484328@qq.com',subject="hello",body='hello, send by ruby...',cc=false)
      params = {
        "apiUser"=> @api_user ,
        "apiKey"=> @api_key ,
        "from"=>"test@test.com" ,
        "to"=> to_mail ,
        "subject"=> subject ,
        "plain"=> body ,
        "fromName"=>"虚拟货币套利系统",
      }
      params["cc"] = "nut403@163.com;dccmmtop@gmail.com;yxrworkone@gmail.com;zhupeiyan@126.com" if cc
      send_mail(params)
    end

    private

    def send_mail(params)
      begin
        res = Net::HTTP.post_form(URI(@send_mail), params)
        return res.body
      rescue
        puts "error:#{$!} at:#{$@}"
        puts "send_post encounters error,Execution has terminated"
      ensure
      end
    end

  end

  def log_in(user)
    session[:user_id]=user.id
  end

  def current_user
    @current_user ||= User.find_by(id: session[:user_id])
  end

  def loged_in?
    !current_user.nil?
  end


end
