# This migration comes from chaltron_engine (originally 20140909115653)
class AddRolesMaskToUsers < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :roles_mask, :integer
  end
end
