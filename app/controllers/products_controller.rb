class ProductsController < ApplicationController
  def index
    @products = Product.order(name: :asc).limit(6)
    @products_with_discount = Product.order(:price).limit(1)
  end

  def new
    @product = Product.new
  end

  def create
    fields = params.require(:product).permit(:name, :description, :price, :amount)
    
    @product = Product.new fields

    if @product.save
      flash[:notice] = 'Produto salvo com sucesso!'
      redirect_to root_url
    else
      render :new
    end
  end

  def destroy
    id = params[:id]

    Product.destroy(id)

    redirect_to root_url
  end

  def search
    @name = params[:name]
    
    @products = Product.where('name like ?', "%#{@name}%")
  end
end
