class AddNameAndFixedAndCapacityAndPositionAndTypeToColumns < ActiveRecord::Migration
  def change
    add_column :columns, :name, :string
    add_column :columns, :fixed, :boolean
    add_column :columns, :capacity, :integer
    add_column :columns, :position, :integer
    add_column :columns, :type, :string
  end
end
