class RemoveSaltFromDesigner < ActiveRecord::Migration
  def change
    remove_column :designers, :salt, :string
  end
end
