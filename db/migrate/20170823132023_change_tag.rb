class ChangeTag < ActiveRecord::Migration[5.1]
  def change
    change_column :tags,:topics_count,:integer,default:0
  end
end
