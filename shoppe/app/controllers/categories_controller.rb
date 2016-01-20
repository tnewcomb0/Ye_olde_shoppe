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



  def new
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
    if params[:category].include?(:admin)
      if @admin
        category = Category.find(params[:id])
        category.update_attributes(admin: params[:category][:admin])
        redirect_to "/categorys"
      end
    else
    @current_user.update(category_params)
    @current_user.save
    session[:category_id] = @category.id
    redirect_to @category
    end
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




