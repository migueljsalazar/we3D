class RemoveStartFromCampaign < ActiveRecord::Migration
  def change
    remove_column :campaigns, :start, :boolean
  end
end
