class RemoveTopicsCountFromCategories < ActiveRecord::Migration[5.1]
  def change
    remove_column :categories,:topics_count,:integer
  end
end
