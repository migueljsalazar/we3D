class CreateCustomers < ActiveRecord::Migration
  def change
    create_table :customers do |t|
      t.string :username
      t.string :password_digest

      t.timestamps null: false
    end
    add_index :customers, :username, unique: true
  end
end
