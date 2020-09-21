class ProductOrder
  include ActiveModel::Model
  attr_accessor :token, :postal_code, :prefecture_id, :city, :address, :building_name, :phone_number, :user_id, :product_id

  # バリデーション
  validates :token, presence: true
  POSTAL_CODE_REGEX = /\A\d{3}[-]\d{4}\z/.freeze
  validates :postal_code, presence: true, format: { with: POSTAL_CODE_REGEX, message: 'は「-」を含む7桁で入力してください' }
  validates :prefecture_id, numericality: { other_than: 1, message: 'を選択してください' }
  validates :city, :address, presence: true
  PHONE_NUMBER_REGEX = /\A[0-9]+\z/.freeze
  validates :phone_number, presence: true, format: { with: PHONE_NUMBER_REGEX, message: 'は半角数字で入力してください' }

  def save
    order = Order.create(user_id: user_id, product_id: product_id)
    SendingAddress.create(postal_code: postal_code, prefecture_id: prefecture_id, city: city, address: address, \
                          building_name: building_name, phone_number: phone_number, order_id: order.id)
  end
end
