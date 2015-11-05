class CreateCampaigns < ActiveRecord::Migration
  def change
    create_table :campaigns do |t|
      t.string :status
      t.boolean :start
      t.boolean :availability
      t.integer :goal
      t.decimal :profit
      t.string :title
      t.string :description
      t.datetime :length
      t.binary :image
      t.decimal :price

      t.timestamps null: false
    end
  end
end
