class AddTagCountToSettings < ActiveRecord::Migration[5.1]
  def change
    add_column :settings, :tag_count, :integer,default: 10
  end
end
