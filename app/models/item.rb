class Item < ApplicationRecord

  belongs_to :user
  has_one_attached :image


  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :item_category
  belongs_to :shipping_cost
  belongs_to :shipping_date
  belongs_to :prefecture
  belongs_to :item_status

  validates :user_id, :information, presence: true
  validates :name, length: { maximum: 40 },presence: true
  validates :price, presence: true,numericality: { in: 300..9999999 }
  validates :category_id, :shipping_cost_id, :shipping_date_id, :prefecture_id, :item_status_id, numericality: { other_than: 1 , message: "can't be blank"}


end