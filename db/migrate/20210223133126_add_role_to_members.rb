class AddRoleToMembers < ActiveRecord::Migration[6.0]
  def change
    add_column :members, :role, :integer, default: 0
  end
end
