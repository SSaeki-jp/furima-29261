class SendingAddress < ApplicationRecord
  # バリデーション
  validates :city, :address, presence: true
  validates :prefecture_id, numericality: { other_than: 1, message: 'を選択してください' }
  
  POSTAL_CODE_REGEX = /\A\d{3}[-]\d{4}\z/.freeze
  validates :postal_code, presence: true, format: { with: POSTAL_CODE_REGEX, message: 'は「-」を含む7桁で入力してください' }

  validates :phone_number, presence: true, numericality: true

  # アソシエーション
  belongs_to :order
end
