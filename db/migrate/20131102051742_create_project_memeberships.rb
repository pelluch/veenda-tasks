class CreateProjectMemeberships < ActiveRecord::Migration
  def change
    create_table :project_memeberships do |t|
      t.string :email
      t.string :permission
      t.integer :project_id
      t.integer :user_id
      t.string :type

      t.timestamps
    end
  end
end
