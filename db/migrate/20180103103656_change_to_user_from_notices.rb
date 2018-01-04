class ChangeToUserFromNotices < ActiveRecord::Migration[5.1]
  def change
    remove_column :notices,:to_user,:integer
    add_column :notices,:to_user,:string
  end
end
