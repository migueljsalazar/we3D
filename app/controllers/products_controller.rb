class ProductsController < ApplicationController

  def new
     @product = Product.new
  end

  def create
    @product = Product.new(product_params)

    if @product.save
      redirect_to @product, notice: 'image was successfully created.'
     else
       render action: 'new'
    end
  end

  private

  def product_params
    params.require(:product).permit(:product_image, :name)
  end
end
