class RenameVeendaTests < ActiveRecord::Migration
  def up
  	rename_table :veenda_tests, :kanban_tests
  end

  def down
  	rename_table :kanban_tests, :veenda_tests
  end
end
