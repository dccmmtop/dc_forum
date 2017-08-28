class Category < ActiveRecord::Migration[5.1]
  def change
    create_table :categories do |t|
      t.string :name, null:false
      t.integer :topics_count

      t.timestamps
    end
  end
end
