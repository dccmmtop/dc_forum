class AddColumnToUsersMore < ActiveRecord::Migration[5.1]
  def change
    add_column :users,:sex,:integer
    add_column :users,:summary,:text
    add_column :users,:birthday,:datetime
    add_column :users,:address,:string
    add_column :users,:marital_status,:string
    add_column :users,:degree,:string
  end
end
