class DesignerDashboardController < ApplicationController
  def index
     if current_designer
    @products = current_designer.products.all
    @campaigns = current_designer.campaigns.all
    else
    redirect_to '/login'
  end
  end
end
