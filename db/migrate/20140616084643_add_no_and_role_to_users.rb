class AddNoAndRoleToUsers < ActiveRecord::Migration
  def change
    add_column :users, :no, :string
    add_column :users, :role, :string
  end
end
