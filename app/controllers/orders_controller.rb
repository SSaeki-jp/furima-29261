class OrdersController < ApplicationController
  before_action :move_to_user_session
  before_action :set_product, only: [:index, :create]
  before_action :move_to_product_index, only: [:index, :create]
  before_action :is_order_move_to_product_index, only: [:index, :create]

  def index
    @product_order = ProductOrder.new
  end

  def create
    @product_order = ProductOrder.new(order_params)
    if @product_order.valid?
    # if card.save
      pay_item
      @product_order.save
      redirect_to root_path
    # end
    else
      render :index
    end
  end

  private

  def move_to_user_session
    redirect_to new_user_session_path unless user_signed_in?
  end

  def set_product
    @product = Product.find(params[:product_id])
  end

  def move_to_product_index
    redirect_to root_path if current_user.id == @product.user_id
  end

  def is_order_move_to_product_index
    redirect_to root_path if @product.order.present?
  end

  def order_params
    params.permit(:authenticity_token, :token, :postal_code, :prefecture_id, :city, :address, :building_name, :phone_number, :product_id).merge(user_id: current_user.id)
  end

  def pay_item
    Payjp.api_key = ENV['PAYJP_SECRET_KEY']
    Payjp::Charge.create(
      amount: @product.price,
      card: order_params[:token],
      currency: 'jpy'
    )

    # トークン化したクレカ情報を、ユーザに紐づけて保存しておく場合
    # Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
    # customer = Payjp::Customer.create(
    #   description: 'test',
    #   card: params[:card_token]
    # )
    # card = Card.new( # トークン化されたカード情報を保存する
    #   card_token: params[:card_token], # カードトークン
    #   customer_token: customer.id, # 顧客トークン
    #   user_id: current_user.id # ログインしているユーザー
    # )

  end
end
