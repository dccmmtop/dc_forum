class SettingsController < ApplicationController

  def edit
      @setting=Setting.find(params[:id])
  end

  def update
      @setting=Setting.find(params[:id])
      @setting.update(setting_params)
      redirect_to edit_setting_path(current_user.setting.id),notice: "更新成功!"
  end

  def setting_params
    params.require(:setting).permit(:manages_per_page_count,:category_list_count,:comment_list_count,:read_rank_list_count,:comment,:comment)
  end
end
