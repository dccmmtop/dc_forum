class ChangeStatusFromLimits < ActiveRecord::Migration[5.1]
  def change
    remove_column :limits,:status,:string
    add_column :limits,:status,:integer
  end
end
