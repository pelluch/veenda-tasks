class RemoveUpdatedAtFromTaskEvents < ActiveRecord::Migration
  def up
    remove_column :task_events, :updated_at
  end

  def down
    add_column :task_events, :updated_at, :datetime
  end
end
