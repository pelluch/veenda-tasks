class CreateIssues < ActiveRecord::Migration
  def change
    create_table :issues do |t|
      t.string :url
      t.integer :task_id
      t.boolean :resolved
      t.string :type

      t.timestamps
    end
  end
end
