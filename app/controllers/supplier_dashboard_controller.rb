class SupplierDashboardController < ApplicationController

  def index
     if current_supplier
      @campaigns = Campaign.all
    else
    redirect_to '/login'
  end
  end
end
