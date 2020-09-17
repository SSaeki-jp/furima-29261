class SendingAddress < ApplicationRecord
  # アソシエーション
  belongs_to :order
end
