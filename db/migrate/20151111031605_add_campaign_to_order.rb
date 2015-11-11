class AddCampaignToOrder < ActiveRecord::Migration
  def change
    add_reference :orders, :campaign, index: true, foreign_key: true
  end
end
