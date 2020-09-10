class Product < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions

  # バリデーション
  validates :image, :name, :explanation, :user_id, presence: true
  validates :price, presence: true, numericality: { greater_than_or_equal_to: 300, less_than_or_equal_to: 9999999 }
  # アクティブハッシュのバリデーション
  validates :category_id, :product_status_id, :shipping_charges_id, :prefecture_id, :estimated_shipping_date_id,
            numericality: { other_than: 1, message: 'を選択してください'}

  # アソシエーション
  has_many         :comments
  has_one          :order
  belongs_to       :user
  # 画像保存のアソシエーション
  has_one_attached :image
  # アクティブハッシュのアソシエーション
  belongs_to_active_hash :category_id, :product_status_id, :shipping_charges_id,
                         :prefecture_id, :estimated_shipping_date_id
end
