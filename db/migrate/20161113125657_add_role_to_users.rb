class AddRoleToUsers < ActiveRecord::Migration
  def change
    add_column :users, :role, :integer, nil: false, default: 0
  end
end
