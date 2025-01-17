class Order < ApplicationRecord
  belongs_to :purchase

  validates :postal_code, presence: true, format: { with: /\A\d{3}-\d{4}\z/, message: "is invalid. Enter it as '123-4567'" }
  validates :prefecture_id, numericality: { other_than: 0, message: "can't be blank" }
  validates :city, :house_number, :telephone_number, presence: true
  validates :telephone_number, format: { with: /\A\d{10,11}\z/, message: "is invalid. Enter 10 or 11 digits without hyphens" }
end
