class TagsTopics < ActiveRecord::Migration[5.1]
  def change
    create_table :tags_topics ,id:false do |t|
      t.integer :topic_id
      t.integer :tag_id
    end
    add_index :tags_topics, :topic_id
    add_index :tags_topics, :tag_id
  end
end
