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

  PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i.freeze
  validates :password, presence: true, format: { with: PASSWORD_REGEX, message: 'は英数字混在で入力してください' }

  FULLWIDTH_REGEX = /\A[ぁ-んァ-ン一-龥]+\z/.freeze
  with_options presence: true, format: { with: FULLWIDTH_REGEX } do
    validates :lastname_fullwidth_kanji
    validates :firstname_fullwidth_kanji
  end

  FULLWIDTH_KATAKANA_REGEX = /\A[ァ-ン]+\z/.freeze
  with_options presence: true, format: { with: FULLWIDTH_KATAKANA_REGEX } do
    validates :lastname_fullwidth_katakana
    validates :firstname_fullwidth_katakana
  end
end
