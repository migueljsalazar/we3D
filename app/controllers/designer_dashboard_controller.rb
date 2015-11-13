class DesignerDashboardController < ApplicationController
  def index
    @products = current_designer.products.all
    @campaigns = current_designer.campaigns.all
  end
end
