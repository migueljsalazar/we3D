class SuppliersController < ApplicationController
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
    def supplier_params
      params.
        require(:supplier).
        permit(:username, :password, :password_confirmation)
  end

end
