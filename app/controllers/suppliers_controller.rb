class SuppliersController < ApplicationController
 before_action :set_designer, only: [:show, :edit, :update, :destroy]

  def new
    @supplier = Supplier.new
  end

  def create
    @supplier = Supplier.new supplier_params

    if @supplier.save
      redirect_to root_path, notice: "Created Supplier"
    else
      render action: "new"
    end
  end

  private
  def set_supplier
      @supplier = current_supplier.find(params[:id])
  end

  def supplier_params
    params.
      require(:supplier).
      permit(:username, :password, :email, :password_confirmation)
  end

end
