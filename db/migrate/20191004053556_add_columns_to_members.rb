class AddColumnsToMembers < ActiveRecord::Migration[6.0]
  def change
    add_column :members, :intro, :text
  end
end
