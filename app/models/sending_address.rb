class SendingAddress < ApplicationRecord
  # バリデーション
  validates :city, :address, presence: true
  validates :prefecture_id, numericality: { other_than: 1, message: 'を選択してください' }
  
  POSTAL_CODE_REGEX = /\A\d{3}[-]\d{4}\z/.freeze
  validates :postal_code, presence: true, format: { with: POSTAL_CODE_REGEX, message: 'は「-」を含む7桁で入力してください' }

  PHONE_NUMBER_REGEX = /\A[0-9]+\z/.freeze
  validates :phone_number, presence: true, format: {with: PHONE_NUMBER_REGEX, message: 'は半角数字で入力してください' }

  # アソシエーション
  belongs_to :order
end
