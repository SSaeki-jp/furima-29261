class Product < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions

  # バリデーション
  validates :image, :name, :explanation, presence: true
  validates :price, presence: true, numericality: { greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999 }
  # アクティブハッシュのバリデーション
  validates :category_id, :product_status_id, :shipping_charge_id, :prefecture_id, :estimated_shipping_date_id,
            numericality: { other_than: 1, message: 'を選択してください' }

  # アソシエーション
  has_many         :comments
  has_one          :order
  belongs_to       :user
  # 画像保存のアソシエーション
  has_one_attached :image
  # アクティブハッシュのアソシエーション
  belongs_to_active_hash :category
  belongs_to_active_hash :product_status
  belongs_to_active_hash :shipping_charge
  belongs_to_active_hash :prefecture
  belongs_to_active_hash :estimated_shipping_date
end
