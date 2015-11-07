class ProductController < ApplicationController
   def create
    @product = Product.new(product_params)

    if @product.save
      redirect_to @product, notice: 'product was successfully created.'
     else
       render action: 'new'
    end
  end

  private

  def product_params
    params.require(:product).permit(:image, :name)
  end
end
end
