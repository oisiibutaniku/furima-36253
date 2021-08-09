class PurchaseAddress
  include ActiveModel::Model
  attr_accessor :token, :postal_code, :prefecture_id, :city, :street, :building , :phone, :user_id, :item_id

  with_options presence: true do
    validates :postal_code, format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Enter it as follows (e.g. 123-4567)"}
    validates :city
    validates :street
    validates :token
    validates :user_id
    validates :item_id
    validates :phone, length: {minimum:10, maximum:11}
  end
  validates :prefecture_id, numericality: { other_than: 1 , message: "can't be blank"} 
  validates :phone,format: {with: /\A[0-9]+\z/, message: "number is invalid. Input only number"}
    



  def save
   purchase = Purchase.create( user_id: user_id, item_id: item_id)
   Address.create( postal_code: postal_code, prefecture_id: prefecture_id, city: city, street: street, building: building, phone: phone, purchase_id: purchase.id)
  end
end