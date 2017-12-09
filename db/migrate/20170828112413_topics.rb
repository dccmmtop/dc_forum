class Topics < ActiveRecord::Migration[5.1]
  def change
    create_table :topics do |t|
      t.string :title
      t.string :summary
      t.text :body, null: false
      t.integer :user_id
      t.integer :read_count, default: 0
      t.string  :tag
      t.integer :category_id, default: 1, null: false

      t.timestamps
    end
  end
end
