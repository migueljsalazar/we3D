class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.decimal :x
      t.decimal :y
      t.decimal :z
      t.integer :base_cost
      t.integer :profit
      t.boolean :color

      t.timestamps null: false
    end
  end
end
