class AddTopicsCountToTag < ActiveRecord::Migration[5.1]
  def change
    add_column :tags, :topics_count, :integer,defalut:0,null:false
  end
end
