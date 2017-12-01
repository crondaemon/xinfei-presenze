# This migration comes from chaltron_engine (originally 20140430143650)
class AddUsernameToUsers < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :username, :string
    add_column :users, :fullname, :string

    add_index :users, :username, unique: true
  end
end
