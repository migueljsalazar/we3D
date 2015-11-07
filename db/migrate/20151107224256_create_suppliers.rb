class CreateSuppliers < ActiveRecord::Migration
  def change
    create_table :suppliers do |t|
      t.string :username
      t.string :password_digest
      t.string :company_name
      t.string :first_name
      t.string :last_name
      t.string :address
      t.string :city
      t.string :zip_code
      t.string :email
      t.integer :price_per_cm3

      t.timestamps null: false
    end
    add_index :suppliers, :username, unique: true
  end
end
