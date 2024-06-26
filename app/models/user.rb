class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :items
  has_many :orders

  validates :nickname, :birth_date, presence: true
  with_options presence: true do
    # ひらがな、漢字のみ許可する
    validates :last_name, :first_name, format: { with: /\A[ぁ-んァ-ン一-龥々ー]+\z/, message: 'is invalid. Input full-width characters.' }
    # カタカナのみ許可する
    validates :last_name_kana, :first_name_kana,
              format: { with: /\A[ァ-ヶー]+\z/, message: 'is invalid. Input full-width katakana characters.' }
    # 半角英数字のみ許可する
    validates :password,
              format: { with: /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]+\z/i, message: 'is invalid. Input both letters and numbers.' }
  end
end
