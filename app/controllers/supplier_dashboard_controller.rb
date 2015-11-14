class SupplierDashboardController < ApplicationController

  def index
    if current_supplier
      @chosen_campaigns = current_supplier.campaigns
      @campaigns = Campaign.available
    else
      redirect_to '/login'
    end
  end
end
