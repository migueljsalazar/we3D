class AddUsernameToDesigner < ActiveRecord::Migration
  def change
    add_column :designers, :username, :string
    add_index :designers, :username, unique: true
  end
end
