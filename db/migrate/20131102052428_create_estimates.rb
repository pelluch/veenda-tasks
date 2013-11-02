class CreateEstimates < ActiveRecord::Migration
  def change
    create_table :estimates do |t|
      t.decimal :value
      t.string :label
      t.integer :project_id
      t.string :type

      t.timestamps
    end
  end
end
