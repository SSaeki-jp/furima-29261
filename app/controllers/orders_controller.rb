class OrdersController < ApplicationController
  before_action :move_to_index

  def index
    @product = Product.find(params[:product_id])
    @product_order = ProductOrder.new
  end

  def create
    @product = Product.find(params[:product_id])
    @product_order = ProductOrder.new(order_params)
    if @product_order.valid?
      pay_item
      @product_order.save
      return redirect_to root_path
    else
      render :index
    end
  end

  private

  def move_to_index
    redirect_to new_user_session_path unless user_signed_in?
  end

  def order_params
    params.permit(:token, :postal_code, :prefecture_id, :city, :address, :building_name, :phone_number, :product_id).merge(user_id: current_user.id)
  end

  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
    Payjp::Charge.create(
      amount:   @product.price,
      card:     order_params[:token],
      currency: 'jpy'
    )
  end
end
