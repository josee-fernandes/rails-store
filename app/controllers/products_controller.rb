class ProductsController < ApplicationController
  def index
    @products = Product.order(name: :desc).limit(5)
    @products_with_discount = Product.order(:price).limit(1)
  end

  def create
    product = params.require(:product).permit(:name, :description, :price, :amount)
    Product.create(product)
    
    redirect_to root_url
  end

  def destroy
    id = params[:id]

    product = Product.destroy(id)

    redirect_to root_url
  end
end
