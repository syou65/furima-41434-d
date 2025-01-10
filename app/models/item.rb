class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :situation
  belongs_to :shipping_charge
  belongs_to :prefecture
  belongs_to :shipping_day
  belongs_to :user 
  has_one_attached :image  
  has_one   :purchase 
  validates :image, :title, :detail, presence: true
  validates :category_id, :situation_id, :shipping_charge_id, :prefecture_id, :shipping_day_id, numericality: { other_than: 1, message: "can't be blank" } 
  validates :price, presence: true, numericality: { greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999}               
end
