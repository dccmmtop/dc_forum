class ChangeTags < ActiveRecord::Migration[5.1]
  def change
    rename_column :tags,:topics_id,:topic_id
  end
end
