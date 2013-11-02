class AddBodyAndAuthorIdAndTypeToComments < ActiveRecord::Migration
  def change
    add_column :comments, :body, :string
    add_column :comments, :author_id, :integer
    add_column :comments, :type, :string
  end
end
