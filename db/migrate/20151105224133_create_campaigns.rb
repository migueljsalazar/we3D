class CreateCampaigns < ActiveRecord::Migration
  def change
    create_table :campaigns do |t|
      t.string :status
      t.boolean :start
      t.boolean :availability
      t.integer :goal
      t.integer :profit
      t.string :title
      t.string :description
      t.datetime :length
      t.binary :image
      t.integer :price

      t.timestamps null: false
    end
  end
end
