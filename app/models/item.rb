class Item < ApplicationRecord

  belongs_to :user
  has_one_attached :image


  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :item_category
  belongs_to :shipping_cost
  belongs_to :shipping_date
  belongs_to :prefecture
  belongs_to :item_status

  validates :information,:image,:name, presence: true
  validates :price, presence: true,numericality: { greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999, only_integer: true }
  validates :item_category_id, :shipping_cost_id, :shipping_date_id, :prefecture_id, :item_status_id, numericality: { other_than: 1 , message: "can't be blank"}


end