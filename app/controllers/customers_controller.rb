class CustomersController < ApplicationController
  def new
  @customer = Customer.new
  end

  def create
    @customer = Customer.new customer_params

    if @customer.save
      redirect_to root_path, notice: "You signed up!"
    else
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
      permit(:username, :password, :email, :password_confirmation)
  end
end
