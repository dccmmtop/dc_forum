class AddReadCountToTopics < ActiveRecord::Migration[5.1]
  def change
    add_column :topics, :read_count, :integer,default: 0
    add_column :topics, :tag, :string
  end
end
