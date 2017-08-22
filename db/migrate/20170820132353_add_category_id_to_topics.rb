class AddCategoryIdToTopics < ActiveRecord::Migration[5.1]
  def change
    add_column :topics, :category_id, :integer
  end
end
