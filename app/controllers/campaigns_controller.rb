class CampaignsController < ApplicationController
 before_action :set_campaign, only: [:edit, :update, :destroy]
 before_action :require_logged_in, only: [:edit, :update, :destroy]

  def index
    @campaigns = current_designer.campaigns.all
  end

  def show
    @campaign = Campaign.find(params[:id])
    @order = Order.new
  end

  def new
     @campaign = current_designer.campaigns.new
     @product = Product.find(params[:product])
  end

  def edit
  end

  def create
    @campaign = current_designer.campaigns.new(campaign_params)

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
      @campaign = current_designer.campaigns.find(params[:id])
  end


  def campaign_params
    params.require(:campaign).permit(:product, :title, :length, :description, :price)
  end
end
