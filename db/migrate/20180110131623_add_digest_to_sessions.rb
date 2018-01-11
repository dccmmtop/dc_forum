class AddDigestToSessions < ActiveRecord::Migration[5.1]
  def change
    add_column :sessions, :digest, :string
  end
end
