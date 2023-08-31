class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

   has_many :items
   has_many :orders

   validates :birthday, presence: true
   validates :nickname, length: { maximum: 40 }, presence:true
   validates :password, format: { with:/\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i }
   validates :last_name, :first_name, format: { with:/\A[ぁ-んァ-ヶ一-龥々ー]+\z/}, presence: true
   validates :last_name_kana, :first_name_kana, format: {with:/\A[ァ-ヶー]+\z/}, presence: true
end
