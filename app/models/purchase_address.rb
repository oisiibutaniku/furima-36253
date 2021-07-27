class PurchaseAddress
  include ActiveModel::Model
  attr_accessor :postal_code, :prefecture_id, :city, :street, :building , :phone, :user_id, :item_id

  



  def save
   purchase = Purchase.create( user_id: user_id, item_id: item_id)
   Address.create( postal_code: postal_code, prefecture_id: prefecture_id, city: city, street: street, building: building, phone: phone, purchase_id: purchase.id)
  end
end