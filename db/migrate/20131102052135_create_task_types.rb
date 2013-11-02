class CreateTaskTypes < ActiveRecord::Migration
  def change
    create_table :task_types do |t|
      t.string :name
      t.integer :color_code
      t.integer :project_id
      t.integer :position
      t.string :type

      t.timestamps
    end
  end
end
