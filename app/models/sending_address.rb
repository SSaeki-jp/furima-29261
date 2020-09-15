class SendingAddress < ApplicationRecord
  # バリデーション
  validates :postal_code, :city, :address, :phone_number, presence: true
  validates :prefecture_id, numericality: { other_than: 1, message: 'を選択してください' }

  # アソシエーション
  belongs_to :order
end
