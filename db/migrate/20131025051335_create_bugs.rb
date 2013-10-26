class CreateBugs < ActiveRecord::Migration
  def change
    create_table :bugs do |t|
      t.integer :task_id
      t.string :description

      t.timestamps
    end
  end
end
