class ProductsController < ApplicationController
  def index
    current_user
    @product = Product.all
  end

  def create
    @product = Product.new(product_params)
    p @product.save
    redirect_to "/categories/#{params[:product][:category_id]}"
  end



  def new
  end

  def edit
    current_user
    @product = Product.find(params[:id])
  end

  def show
    current_user
    @product = Product.find(params[:id])
  end

  def update
    current_user
    if params[:product].include?(:admin)
      if @admin
        product = Product.find(params[:id])
        product.update_attributes(admin: params[:product][:admin])
        redirect_to "/products"
      end
    else
    @current_user.update(product_params)
    @current_user.save
    session[:product_id] = @product.id
    redirect_to @product
    end
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




