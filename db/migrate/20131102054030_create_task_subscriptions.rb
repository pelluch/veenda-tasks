class CreateTaskSubscriptions < ActiveRecord::Migration
  def change
    create_table :task_subscriptions do |t|
      t.integer :task_id
      t.integer :user_id
      t.string :type

      t.timestamps
    end
  end
end
