class AddNameAndTypeToWorkspaces < ActiveRecord::Migration
  def change
    add_column :workspaces, :name, :string
    add_column :workspaces, :type, :string
  end
end
