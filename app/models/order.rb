class Order < ApplicationRecord
  # アソシエーション
  has_one    :sending_address
  belongs_to :product, :user
end
