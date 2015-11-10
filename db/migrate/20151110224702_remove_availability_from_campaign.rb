class RemoveAvailabilityFromCampaign < ActiveRecord::Migration
  def change
    remove_column :campaigns, :availability, :boolean
  end
end
