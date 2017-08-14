class UpdateTopics < ActiveRecord::Migration[5.1]
  def change
    change_column :topics,:title,:string,null: false
    change_column :topics,:body,:text,null: false
  end
end
