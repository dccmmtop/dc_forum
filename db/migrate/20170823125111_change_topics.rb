class ChangeTopics < ActiveRecord::Migration[5.1]
  def change
    change_column :topics,:category_id,:integer,default: 1,null:false
  end
end
