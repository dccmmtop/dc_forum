class SettingsController < ApplicationController

  def edit
      @setting=Setting.find(params[:id])
  end

  def update
    
  end

  def setting_params
    param.require(:setting).permit(:manages_per_page_count,:category_list_count,:comment_list_count,:read_rank_list_count,:comment,:comment)
  end
end
