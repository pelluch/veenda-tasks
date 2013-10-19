class CreateColumns < ActiveRecord::Migration
  def change
    create_table :columns do |t|
      t.integer :project_id

      t.timestamps
    end
  end
end
