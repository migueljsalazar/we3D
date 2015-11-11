class ProductsController < ApplicationController
  before_action :set_product, only: [:show, :edit, :update, :destroy]
  before_action :require_logged_in


  def index
    @products = current_designer.products.all
  end

  def show
    @product = current_designer.products.find(params[:id])
  end

  def new
     @product = current_designer.products.new
  end

  def create
    @product = current_designer.products.new(product_params)

    respond_to do |format|
      if @product.save
        format.html { redirect_to @product, notice: 'Product was successfully created.' }
        format.json { render :show, status: :created, location: @product }
      else
        format.html { render :new }
        format.json { render json: @product.errors, status: :unprocessable_entity }
      end
    end
  end

   def update
    respond_to do |format|
      if @product.update(product_params)
        format.html { redirect_to @product, notice: 'Product was successfully updated.' }
        format.json { render :show, status: :ok, location: @product }
      else
        format.html { render :edit }
        format.json { render json: @product.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @product.destroy
    respond_to do |format|
      format.html { redirect_to products_url, notice: 'Product was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  def set_product
    @product = current_designer.products.find(params[:id])
  end


  def product_params
    params.require(:product).permit(:name, :x, :y, :z, :color, :base_cost, :profit, :product_image_file_name, :product_image_content_type, :product_image_file_size, :product_image_updated_at, :designer_id)
  end
end
