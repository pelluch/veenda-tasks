class CreateUpdates < ActiveRecord::Migration
  def change
    create_table :updates do |t|
      t.integer :resource_type
      t.integer :update_type
      t.integer :resource_id

      t.timestamps
    end
  end
end
