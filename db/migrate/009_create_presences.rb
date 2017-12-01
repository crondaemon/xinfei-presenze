class CreatePresences < ActiveRecord::Migration[5.1]
  def change
    create_table :presences do |t|
      t.date :when
      t.integer :user_id

      t.timestamps
    end
  end
end
