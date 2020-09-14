class ProductsController < ApplicationController
  before_action :move_to_index, except: [:index, :show]

  def index
    @products = Product.all.order("created_at DESC")
  end

  def new
    @product = Product.new
  end

  def create
    @product = Product.new(product_params)
    if @product.save
      redirect_to root_path
    else
      render :new
    end
  end

  def show
    @product = Product.find(params[:id])
  end

  private

  def move_to_index
    redirect_to new_user_session_path unless user_signed_in?
  end

  def product_params
    params.require(:product).permit(:image, :name, :explanation, :category_id, :product_status_id, :shipping_charge_id, \
                                    :prefecture_id, :estimated_shipping_date_id, :price).merge(user_id: current_user.id)
  end
end
