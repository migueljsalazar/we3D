class RemoveLastNameFromSuppliers < ActiveRecord::Migration
  def change
    remove_column :suppliers, :last_name, :string
  end
end
