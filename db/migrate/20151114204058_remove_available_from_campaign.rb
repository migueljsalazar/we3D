class RemoveAvailableFromCampaign < ActiveRecord::Migration
  def change
    remove_column :campaigns, :available, :boolean
  end
end
