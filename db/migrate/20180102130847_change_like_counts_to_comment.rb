class ChangeLikeCountsToComment < ActiveRecord::Migration[5.1]
  def change
    change_column :comments,:like_counts, :integer,defaut: 0
  end
end
