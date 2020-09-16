class OrdersController < ApplicationController
  before_action :move_to_index

  def index
    @product = Product.find(params[:product_id])
  end

  def create
    @order = Order.new(price: order_params[:price])
    if @order.valid?
      pay_item
      @order.save
      return redirect_to root_path
    else
      render 'index'
    end
  end

  private

  def move_to_index
    redirect_to new_user_session_path unless user_signed_in?
  end

  def order_params
    params.permit(:price, :token)
  end

  def pay_item
    Payjp.api_key = "sk_test_XXXXXXXX"
    Payjp::Charge.create(
      amount: order_params[:price],
      card: order_params[:token],
      currency:'jpy'
    )
  end
end
