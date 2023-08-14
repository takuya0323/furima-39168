class Item < ApplicationRecord

  belongs_to :user
  has_one_attached :image


  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :cost
  belongs_to :date
  belongs_to :prefecture
  belongs_to :status

  validates :user_id, :information, presence: true
  validates :name, length: { maximum: 40 },presence: true
  validates :price, presence: true,numericality: { in: 300..9999999 }
  validates :category_id, :cost_id, :date_id, :prefecture_id, :status_id, numericality: { other_than: 1 , message: "can't be blank"}


end