class CustomersController < ApplicationController
  def new
  @customer = customer.new
  end

  def create
    @customer = customer.new customer_params

    if @customer.save
      redirect_to root_path, notice: "You signed up!"
    else
      flash[:notice] = "Form is invalid"
      flash[:color]= "invalid"
      render action:  "new"
    end
  end

  private

  def set_customer
      @customer = current_customer.find(params[:id])
  end

  def customer_params
    params.
      require(:customer).
      permit(:username, :password, :password_confirmation)
  end
end
