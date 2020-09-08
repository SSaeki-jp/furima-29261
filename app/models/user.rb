class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  
  # アソシエーション
  has_many :products
  has_many :orders

  # バリデーション
  validates :nickname, :birthday, presence: true

  with_options presence: true, format: { with: /\A[ぁ-んァ-ン一-龥]+\z/, message: '全角文字を使用してください' } do
    validates :lastname_fullwidth_kanji
    validates :firstname_fullwidth_kanji
  end

  with_options presence: true, format: { with: /\A[ァ-ン]+\z/, message: 'カタカナを使用してください' } do
    validates :lastname_fullwidth_katakana
    validates :firstname_fullwidth_katakana
  end
end
