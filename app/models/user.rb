class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
         
  has_many :items
  # has_many :buyers

  with_options presence: true do
    validates :nickname

    with_options format: { with: /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]{6,}+\z/i, message: "is invalid. Input half-width alphanumeric characters."} do
      validates :password
    end

    with_options format: { with: /\A[ぁ-んァ-ン一-龥々]+\z/, message: "is invalid. Input full-width characters."} do
      validates :last_name
      validates :first_name
    end

    with_options format: { with: /\A[ァ-ヶー－]+\z/, message: "is invalid. Input full-width katakana characters."} do
      validates :last_name_kana
      validates :first_name_kana
    end

    validates :birthday
  end
end