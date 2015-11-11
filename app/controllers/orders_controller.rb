class OrdersController < ApplicationController
 before_action :set_order, only: [:show, :edit, :update, :destroy]
 before_action :require_logged_in, only: [:show, :edit, :update, :destroy]

  def index
    @orders = current_campaign.orders.all
  end

  def new
    @order = current_campaign.orders.new
    @campaign = Campaign.find(params[:campaign_id])
  end

  def create
    @order = current_campaign.orders.new order_params.merge(email: stripe_params["stripeEmail"],
                                                               card_token: stripe_params["stripeToken"])
    raise "Please, check order errors" unless @order.valid?
    @order.process_payment
    @order.save
    redirect_to @order, notice: 'order was successfully created.'
  rescue e
    flash[:error] = e.message
    render :new
  end

  def edit
  end

  def show
  end

  def update
    respond_to do |format|
      if @order.update(order_params)
        format.html { redirect_to @order, notice: 'order was successfully updated.' }
        format.json { render :show, status: :ok, location: @order }
      else
        format.html { render :edit }
        format.json { render json: @order.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @order.destroy
    respond_to do |format|
      format.html { redirect_to orders_url, notice: 'order was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  def set_order
      @order = current_campaign.orders.find(params[:id])
  end

  def order_params
    params.require(:order).permit(:first_name, :last_name, :address, :city, :zip_code, :qty)
  end

  def stripe_params
  params.permit :stripeEmail, :stripeToken
  end

end
