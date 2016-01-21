class CategoriesController < ApplicationController

def index
    current_user
    @categories = Category.all
  end

  def create
    @category = Category.new(category_params)
    @category.save
    redirect_to '/categories'
  end



  def edit
    current_user
    @category = Category.find(params[:id])
  end

  def show
    current_user
    @category = Category.find(params[:id])
    @products = @category.products
  end

  def update
    current_user
    category = Category.find(params[:id])
    category.update(category_params)
    category.save
    redirect_to '/categories'
  end

  def destroy
    current_user
    category = Category.find_by(email: params[:email])
    category.destroy if @current_user = category
  end

  private
  def category_params
    params.require(:category).permit(:title)
  end
end




