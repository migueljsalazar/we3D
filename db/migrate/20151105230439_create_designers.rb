class CreateDesigners < ActiveRecord::Migration
  def change
    create_table :designers do |t|
      t.string :username
      t.string :email
      t.string :password
      t.string :salt
      t.integer :profit

      t.timestamps null: false
    end
  end
end
