class OrdersController < ApplicationController
  before_action :move_to_index

  def index
    @product = Product.find(params[:product_id])
  end

  def create
    @order = Order.new(price: order_params[:price])
  end

  private

  def move_to_index
    redirect_to new_user_session_path unless user_signed_in?
  end

  def order_params
    params.permit(:price, :token)
  end
end
