# This migration comes from chaltron_engine (originally 20141205095036)
class AddAdditionalLdapInfoToUser < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :department, :string
  end
end
