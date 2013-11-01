class AddAuthTokenAndUserIdToUpdates < ActiveRecord::Migration
  def change
    add_column :updates, :auth_token, :string
    add_column :updates, :user_id, :integer
  end
end
