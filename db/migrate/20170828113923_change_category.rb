class ChangeCategory < ActiveRecord::Migration[5.1]
  def change
    change_column :categories,:topics_count,:integer,default: 0
  end
end
