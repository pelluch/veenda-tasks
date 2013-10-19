class CreateProjects < ActiveRecord::Migration
  def change
    create_table :projects do |t|
      t.integer :workspace_id

      t.timestamps
    end
  end
end
