class DesignerDashboardController < ApplicationController
  def index
    if current_designer
      @products = current_designer.products.all
      @campaigns = current_designer.campaigns.unavailable.on
      @avail_campaigns = current_designer.campaigns.available.on
      @past_campaigns = current_designer.campaigns.off
    else
      redirect_to '/login'
    end
  end
end
