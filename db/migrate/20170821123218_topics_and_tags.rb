class TopicsAndTags < ActiveRecord::Migration[5.1]
  def change
    create_table :topics_tags ,id:false do |t|
      t.integer :topic_id
      t.integer :tag_id

    end

    add_index :topics_tags, :topic_id
    add_index :topics_tags, :tag_id
  end
end
