class CreateFriendLinks < ActiveRecord::Migration[5.1]
  def change
    create_table :friend_links do |t|
      t.integer :user_id
      t.string :name
      t.string :link

      t.timestamps
    end
  end
end
