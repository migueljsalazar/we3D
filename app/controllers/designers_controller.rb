class DesignersController < ApplicationController
  before_action :set_designer, only: [:show, :edit, :update, :destroy]

  def new
    if current_designer
      redirect_to root_path
    else
    @designer = Designer.new
  end
  end

  def create
    @designer = Designer.new designer_params

    if @designer.save
      redirect_to root_path, notice: "You signed up!"
    else
      render action:  "new"
    end
  end

  private

  def set_designer
      @designer = current_designer.find(params[:id])
  end

  def designer_params
    params.
      require(:designer).
      permit(:username, :password, :email, :password_confirmation)
  end


end
