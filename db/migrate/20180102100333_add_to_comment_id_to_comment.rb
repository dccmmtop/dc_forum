class AddToCommentIdToComment < ActiveRecord::Migration[5.1]
  def change
    add_column :comments, :to_comment_id, :integer
  end
end
