
class ShoppingCartsController < ApplicationController

  def index
    current_user
    p @current_user.shopping_carts
    @active_items = @current_user.shopping_carts.select { |item| item.order_id == nil}
  end

  def create
    current_user
    shopping_cart = ShoppingCart.new(product_id: params[:product_id])
    @current_user.shopping_carts << shopping_cart
    shopping_cart.save
    redirect_to :back
  end

  def update
    current_user
    if params[:shopping_cart].include?(:admin)
      if @admin
        shopping_cart = ShoppingCart.find(params[:id])
        shopping_cart.update_attributes(admin: params[:shopping_cart][:admin])
        redirect_to "/shopping_carts"
      end
    else
    @current_user.update(shopping_cart_params)
    @current_user.save
    session[:shopping_cart_id] = shopping_cart.id
    redirect_to shopping_cart
    end
  end

  def destroy
    current_user
    shopping_cart = ShoppingCart.find_by(email: params[:email])
    shopping_cart.destroy if @current_user = shopping_cart
  end

  private
  def shopping_cart_params
    params.require(:shopping_cart).permit(:product_id)
  end
end




