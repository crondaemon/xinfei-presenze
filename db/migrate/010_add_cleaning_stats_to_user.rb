class AddCleaningStatsToUser < ActiveRecord::Migration[5.2]
  def change
  	add_column :users, :cleaner, :boolean, default: false, null: false
  	add_column :users, :cleaning_shifts, :integer, default: 0, null: false
  	add_column :users, :rest_shifts, :integer, default: 0, null: false
  end
end
