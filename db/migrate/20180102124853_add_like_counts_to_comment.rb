class AddLikeCountsToComment < ActiveRecord::Migration[5.1]
  def change
    add_column :comments, :like_counts, :integer
  end
end
