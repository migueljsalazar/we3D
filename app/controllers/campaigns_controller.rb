class CampaignsController < ApplicationController
 before_action :require_logged_in, only: [:new, :edit, :update, :destroy]
 before_action :currrent_product

  def index
    @campaigns = Campaign.all
  end

  def show
    @campaign = Campaign.find(params[:id])
    @order = Order.new
  end

  def new
     @campaign = @product.campaigns.new
  end

  def edit
  end

  def create
    @campaign = @product.campaigns.new(campaign_params)

    respond_to do |format|
      if @campaign.save
        format.html { redirect_to @campaign, notice: 'Campaign was successfully created.' }
        format.json { render :show, status: :created, location: @campaign }
      else
        format.html { render :new }
        format.json { render json: @campaign.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @campaign.update(campaign_params)
        format.html { redirect_to @campaign, notice: 'Campaign was successfully updated.' }
        format.json { render :show, status: :ok, location: @campaign }
      else
        format.html { render :edit }
        format.json { render json: @campaign.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @campaign.destroy
    respond_to do |format|
      format.html { redirect_to campaigns_url, notice: 'Campaign was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  def set_campaign
      @campaign = current_designer.products.campaigns.find(params[:id])
  end

  def current_product
      @product = current_designer.products.find(params[:product])
  end

  def campaign_params
    params.require(:campaign).permit(:product, :title, :length, :description, :price)
  end
end
