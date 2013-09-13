class RemoveIndexRoleIdFromUsers < ActiveRecord::Migration
  def change
    remove_index :users, :role_id
  end
end
