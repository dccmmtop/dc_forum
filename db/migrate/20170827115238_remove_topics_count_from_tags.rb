class RemoveTopicsCountFromTags < ActiveRecord::Migration[5.1]
  def change
    remove_column :tags,:topics_count,:integer
  end
end
