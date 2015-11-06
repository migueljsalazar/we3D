class RemoveUsernameFromDesigner < ActiveRecord::Migration
  def change
    remove_column :designers, :username, :string
  end
end
