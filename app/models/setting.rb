class Setting < ApplicationRecord
  # validates :manages_per_page_count,:category_list_count,:comment_list_count,:read_rank_list_count,length:{minimum:5}
  belongs_to :user
end
