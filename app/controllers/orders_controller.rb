class OrdersController < ApplicationController
  before_action :move_to_index

  def index
    @product = Product.find(params[:product_id])
    @product_order = ProductOrder.new
  end

  def create
    binding.pry
    @product_order = ProductOrder.new(order_params)
    if @product_order.valid?
      pay_item
      @product_order.save
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
    params.permit(:postal_code, :prefecture_id, :city, :address, :building_name, :phone_number, :token).merge(user_id: current_user.id)
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
