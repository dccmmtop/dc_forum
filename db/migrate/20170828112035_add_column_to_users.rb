class AddColumnToUsers < ActiveRecord::Migration[5.1]
  def change
    add_column :users,:qq,:string
    add_column :users,:email_md5,:string
    add_column :users,:password_digest,:string
  end
end
