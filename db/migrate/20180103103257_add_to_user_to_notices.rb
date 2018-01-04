class AddToUserToNotices < ActiveRecord::Migration[5.1]
  def change
    add_column :notices, :to_user, :integer
  end
end
