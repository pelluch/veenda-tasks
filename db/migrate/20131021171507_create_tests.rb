class CreateTests < ActiveRecord::Migration
  def change
    create_table :tests do |t|
      t.integer :tester_id
      t.integer :developer_id

      t.timestamps
    end
  end
end
