class ProductsController < ApplicationController
  def index
    @products = Product.order(name: :desc).limit(2)
    @products_with_discount = Product.order(:price).limit(1)
  end
end
