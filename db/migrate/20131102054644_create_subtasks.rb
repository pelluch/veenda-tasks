class CreateSubtasks < ActiveRecord::Migration
  def change
    create_table :subtasks do |t|
      t.string :body
      t.integer :task_id
      t.integer :creator_id
      t.boolean :completed
      t.string :type

      t.timestamps
    end
  end
end
