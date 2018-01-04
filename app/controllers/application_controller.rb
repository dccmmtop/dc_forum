class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  include SessionsHelper
  include UsersHelper
  include CategoriesHelper
  include TopicsHelper
  include NoticesHelper
  include LimitsHelper
end
