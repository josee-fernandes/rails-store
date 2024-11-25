class ProductsController < ApplicationController
  def index
    @products = Product.order(name: :asc).limit(6)
    @products_with_discount = Product.order(:price).limit(1)
  end

  def new
    @product = Product.new
    @departments = Department.all
  end

  def edit
    id = params[:id]
    @product = Product.find id
    @departments = Department.all
    render :new
  end

  def update
    id = params[:id]
    @product = Product.find id
    fields = params.require(:product).permit(:name, :description, :price, :amount, :department_id)
    if @product.update fields
      flash[:notice] = 'Produto atualizado com sucesso!'
      redirect_to root_url
    else
      @departments = Department.all
      render :new
    end
  end

  def create
    fields = params.require(:product).permit(:name, :description, :price, :amount, :department_id)
    
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
