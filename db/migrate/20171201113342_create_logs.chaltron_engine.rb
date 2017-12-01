# This migration comes from chaltron_engine (originally 20150127174621)
class CreateLogs < ActiveRecord::Migration[5.1]
  def change
    create_table :logs do |t|
      t.string :message, limit: 1000
      t.string :severity
      t.string :category

      t.timestamps null: false
    end
  end
end
