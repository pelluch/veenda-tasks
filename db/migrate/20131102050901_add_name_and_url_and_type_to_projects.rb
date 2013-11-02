class AddNameAndUrlAndTypeToProjects < ActiveRecord::Migration
  def change
    add_column :projects, :name, :string
    add_column :projects, :url, :string
    add_column :projects, :type, :string
  end
end
