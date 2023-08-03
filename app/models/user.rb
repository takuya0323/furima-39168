class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
   validates :nickname,:last_name,:first_name,:last_name_kana,:first_name_kana,:birthday, presence: true
   validates :nickname, length: { maximum: 40 }

end
