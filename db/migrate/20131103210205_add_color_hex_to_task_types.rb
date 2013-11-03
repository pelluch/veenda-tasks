class AddColorHexToTaskTypes < ActiveRecord::Migration
  def change
    add_column :task_types, :color_hex, :string
  end
end
