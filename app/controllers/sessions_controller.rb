class SessionsController < ApplicationController
  def new
  end

  def create
    @designer = Designer.
      find_by(username: params[:username].downcase).
      try(:authenticate, params[:password])

    @supplier = Supplier.
      find_by(username: params[:username].downcase).
      try(:authenticate, params[:password])

    @customer = Customer.
      find_by(username: params[:username].downcase).
      try(:authenticate, params[:password])


    if @designer
      session[:designer_id] = @designer.id
      redirect_to products_new_path

    elsif @supplier
      session[:supplier_id] = @supplier.id
      redirect_to orders_path

    elsif  @customer
      session[:customer_id] = @customer.id
      redirect_to orders_path

    else
      flash[:notice] = "Form is invalid"
      flash[:color]= "invalid"
      render action:  "new"
    end
  end

end
