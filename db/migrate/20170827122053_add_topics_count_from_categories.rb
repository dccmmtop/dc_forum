class AddTopicsCountFromCategories < ActiveRecord::Migration[5.1]
  def change
    add_column :categories, :topics_count, :integer
  end
end
