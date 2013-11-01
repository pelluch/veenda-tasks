class CreateVeendaTests < ActiveRecord::Migration
  def change
    create_table :veenda_tests do |t|
      t.integer :tester_id
      t.integer :developer_id
      t.string :description
      t.string :result

      t.timestamps
    end
  end
end
