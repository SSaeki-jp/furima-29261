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

  validates :password, presence: true, format: { with: /([0-9].*[a-zA-Z]|[a-zA-Z].*[0-9])/, message: 'は英数字混在で入力してください' }

  with_options presence: true, format: { with: /\A[ぁ-んァ-ン一-龥]+\z/ } do
    validates :lastname_fullwidth_kanji
    validates :firstname_fullwidth_kanji
  end

  with_options presence: true, format: { with: /\A[ァ-ン]+\z/ } do
    validates :lastname_fullwidth_katakana
    validates :firstname_fullwidth_katakana
  end
end
