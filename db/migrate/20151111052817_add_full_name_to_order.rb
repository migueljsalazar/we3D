class AddFullNameToOrder < ActiveRecord::Migration
  def change
    add_column :orders, :full_name, :string
  end
end
