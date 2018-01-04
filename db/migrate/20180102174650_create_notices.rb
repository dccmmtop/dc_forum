class CreateNotices < ActiveRecord::Migration[5.1]
  def change
    create_table :notices do |t|
      t.text :content
      t.integer :admin_id

      t.timestamps
    end
  end
end
