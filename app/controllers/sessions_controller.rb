class SessionsController < ApplicationController
  def new
    if current_designer || current_supplier || current_customer
      redirect_to root_path
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
      redirect_to new_product_path

    elsif @supplier
      session[:supplier_id] = @supplier.id
      redirect_to :back

    elsif  @customer
      session[:customer_id] = @customer.id
      redirect_to :back

    else
      flash[:notice] = "Form is invalid"
      flash[:color]= "invalid"
      render action:  "new"
    end
  end

    def destroy
      session[:designer_id] = nil
      session[:supplier_id] = nil
      session[:customer_id] = nil
      redirect_to :back
    end

end
