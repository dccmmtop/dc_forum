class Tags < ActiveRecord::Migration[5.1]
  def change
    create_table :tags do |t|
      t.string :title
       t.string :name
       t.integer :topics_id

      t.timestamps
    end
  end
end
