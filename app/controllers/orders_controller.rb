class OrdersController < ApplicationController
 before_action :set_order, only: [:show, :edit, :update, :destroy]
 before_action :require_logged_in, only: [:show, :edit, :update, :destroy]

  def index
    @order = current_campaign.orders.all
  end

  def new
    @order = current_campaign.orders.new
  end

  def create
    @order = current_campaign.orders.new(order_params)

    respond_to do |format|
      if @order.save
        format.html { redirect_to @order, notice: 'order was successfully created.' }
        format.json { render :show, status: :created, location: @order }
      else
        format.html { render :new }
        format.json { render json: @order.errors, status: :unprocessable_entity }
      end
    end
  end

  def edit
    @order = current_campaign.orders.new
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
end
