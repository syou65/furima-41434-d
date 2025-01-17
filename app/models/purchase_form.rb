class PurchaseForm 
  include ActiveModel::Model
  attr_accessor :user_id, :item_id, :postal_code, :prefecture_id, :city, :house_number, :building_name, :telephone_number, :token
  
  validates :postal_code, presence: true, format: { with: /\A\d{3}-\d{4}\z/, message: "is invalid. Enter it as follows (e.g. 123-4567)" }
  validates :prefecture_id, numericality: { other_than: 1, message: "can't be blank" }
  validates :city, :house_number, :telephone_number, :token, presence: true
  validates :telephone_number, format:  { with: /\A\d{10,11}\z/, message: "is invalid. Enter 10 or 11 digits without hyphens" }
  def save
    purchase = Purchase.create(user_id: user_id, item_id: item_id)

    Order.create(
      postal_code: postal_code,
      prefecture_id: prefecture_id,
      city: city,
      house_number: house_number,
      building_name: building_name,
      telephone_number: telephone_number,
      purchase_id: purchase.id
    )
  end
end