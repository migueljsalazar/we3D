class AddSupplierToCampaign < ActiveRecord::Migration
  def change
    add_reference :campaigns, :supplier, index: true, foreign_key: true
  end
end
