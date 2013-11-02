class AddTitleAndTaskTypeIdAndCreatorIdAndDescriptionAndEstimateIdAndOwnerIdAndPositionAndPriorityAndReadyToPullAndBlockedAndMovedAtAndTypeToTasks < ActiveRecord::Migration
  def change
    add_column :tasks, :title, :string
    add_column :tasks, :task_type_id, :integer
    add_column :tasks, :creator_id, :integer
    add_column :tasks, :description, :string
    add_column :tasks, :estimate_id, :integer
    add_column :tasks, :owner_id, :integer
    add_column :tasks, :position, :integer
    add_column :tasks, :priority, :integer
    add_column :tasks, :ready_to_pull, :boolean
    add_column :tasks, :blocked, :boolean
    add_column :tasks, :moved_at, :datetime
    add_column :tasks, :type, :string
  end
end
