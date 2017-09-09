class CreateSettings < ActiveRecord::Migration[5.1]
  def change
    create_table :settings do |t|
      
      t.integer :manages_per_page_count,default: 10
      t.integer :category_list_count,default: 10
      t.integer :comment_list_count,default: 10
      t.integer :read_rank_list_count,default: 10
      t.boolean :comment,default: true

      t.timestamps
    end
  end
end
