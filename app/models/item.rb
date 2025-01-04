class Item < ApplicationRecord
  belongs_to :user
  validates :title, presence: true
  validates :detail, presence:true
  validates :category_id, presence:true
  validates :situation_id, presence:true
  validates :shipping_charge_id, presence:true
  validates :prefecture_id, presence:true
  validates :shipping_day_id, presence:true
  validates :price, presence:true  
  has_one_attached :image  
  #has_one   :purchase 
end
