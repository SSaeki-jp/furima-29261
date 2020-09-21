class Order < ApplicationRecord
  # アソシエーション
  has_one    :sending_address
  belongs_to :user
  belongs_to :product
end
