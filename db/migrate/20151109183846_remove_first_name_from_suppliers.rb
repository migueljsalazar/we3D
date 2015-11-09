class RemoveFirstNameFromSuppliers < ActiveRecord::Migration
  def change
    remove_column :suppliers, :first_name, :string
  end
end
