class AddAddress2ToOrder < ActiveRecord::Migration
  def change
    add_column :orders, :address2, :string
  end
end
