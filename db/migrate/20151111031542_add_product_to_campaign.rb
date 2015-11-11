class AddProductToCampaign < ActiveRecord::Migration
  def change
    add_reference :campaigns, :product, index: true, foreign_key: true
  end
end
