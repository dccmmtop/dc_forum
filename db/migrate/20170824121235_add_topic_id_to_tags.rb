class AddTopicIdToTags < ActiveRecord::Migration[5.1]
  def change
    add_column :tags, :topic_id, :integer
  end
end
