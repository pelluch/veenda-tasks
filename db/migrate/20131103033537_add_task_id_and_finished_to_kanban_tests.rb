class AddTaskIdAndFinishedToKanbanTests < ActiveRecord::Migration
  def change
    add_column :kanban_tests, :task_id, :integer
    add_column :kanban_tests, :finished, :boolean
  end
end
