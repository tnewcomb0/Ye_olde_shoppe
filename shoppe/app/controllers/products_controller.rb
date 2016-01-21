class ProductsController < ApplicationController
  def index
    current_user
    @product = Product.all
  end

  def create
    @product = Product.new(product_params)
    @product.save
    redirect_to "/categories/#{params[:product][:category_id]}"
  end




  def edit
    current_user
    @product = Product.find(params[:id])
    @category = @product.category
  end

  def show
    current_user
    @product = Product.find(params[:id])
  end

  def update
    current_user
    product = Product.find(params[:id])
    product.update(product_params)
    product.save
    redirect_to "/categories/#{params[:product][:category_id]}"
  end

  def destroy
    current_user
    product = Product.find(params[:id])
    product.destroy if @current_user = product
  end

  private
  def product_params
    params.require(:product).permit(:title, :description, :price, :photo_url, :category_id)
  end
end




