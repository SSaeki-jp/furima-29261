class ProductsController < ApplicationController
  before_action :move_to_index, except: [:index, :show]

  def index
  end

  def new
  end

  def move_to_index
    # redirect_to action: :index unless user_signed_in?
    unless user_signed_in?
      redirect_to action: :index
    end
  end
end
