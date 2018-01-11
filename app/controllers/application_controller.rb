class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  include SessionsHelper
  include UsersHelper
  include CategoriesHelper
  include TopicsHelper
  include NoticesHelper
  include LimitsHelper
  include LikesHelper

  def require_login(*args)
    unless current_user 
      redirect_to  login_path
    end
  end
  
  def require_admin
    unless Admin.find_by(user_id: current_user.id)
      redirect_to not_found_url
    end

  end
end
