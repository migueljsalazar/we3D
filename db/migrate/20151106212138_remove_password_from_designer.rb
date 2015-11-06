class RemovePasswordFromDesigner < ActiveRecord::Migration
  def change
    remove_column :designers, :password, :string
  end
end
