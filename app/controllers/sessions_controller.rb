class SessionsController < ApplicationController
  def new
    if current_designer || current_supplier
      redirect_to root_path
    end
  end

  def create
    @designer = Designer.
      find_by(username: params[:username].downcase).
      try(:authenticate, params[:password])

    @supplier = Supplier.
      find_by(username: params[:username].downcase).
      try(:authenticate, params[:password])

    if @designer
      session[:designer_id] = @designer.id
      redirect_to designer_dashboard_index_path

    elsif @supplier
      session[:supplier_id] = @supplier.id
      redirect_to supplier_dashboard_index_path

    else
      flash[:notice] = "Form is invalid"
      flash[:color]= "invalid"
      render action:  "new"
    end
  end

  def destroy
    session[:designer_id] = nil
    session[:supplier_id] = nil
    redirect_to root_path
  end

end
