class CreateTaskEvents < ActiveRecord::Migration
  def change
    create_table :task_events do |t|
      t.integer :task_id
      t.text :message
      t.string :name
      t.integer :user_id
      t.integer :project_id
      t.integer :column_id
      t.text :title

      t.timestamps
    end
  end
end
