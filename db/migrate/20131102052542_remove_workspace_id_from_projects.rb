class RemoveWorkspaceIdFromProjects < ActiveRecord::Migration
  def up
    remove_column :projects, :workspace_id
  end

  def down
    add_column :projects, :workspace_id, :integer
  end
end
