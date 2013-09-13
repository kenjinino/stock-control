class AddIndexRoleIdToUsers < ActiveRecord::Migration
  def change
    add_index :users, :role_id
  end
end
