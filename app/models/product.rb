class Product < ApplicationRecord

  # アクティブハッシュ用のクラスの継承
  extend ActiveHash::Associations::ActiveRecordExtensions

  # バリデーション
  validates :name, :explanation, :user_id, presence: true
  # アクティブハッシュによるバリデーション
  validates :category_id, :product_status_id, :shipping_charges_id, 
            :prefecture_id, :estimated_shipping_date_id, numericality: { other_than: 1 }

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
