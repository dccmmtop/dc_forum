class CreateLimits < ActiveRecord::Migration[5.1]
  def change
    create_table :limits do |t|
      t.integer :admin_id
      t.string :to_user
      t.string :status

      t.timestamps
    end
  end
end
