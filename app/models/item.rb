class Item < ApplicationRecord
  
  belongs_to :user
  has_one_attached :image
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :state
  belongs_to :burden
  belongs_to :prefecture
  belongs_to :day
  has_one    :purchase

  with_options presence: true do
validates :product
validates :explanation
validates :price
validates :image
validates :category_id, :state_id,:burden_id,:prefecture_id,:day_id
  end
with_options numericality: { other_than: 1 , message: "can't be blank"} do
validates :category_id
validates :state_id
validates :burden_id
validates :prefecture_id
validates :day_id
end
validates :price, inclusion: { in: 300..9_999_999, message: "is out of setting range"}
validates :price, numericality: { only_integer: true,message: "is invalid. Input half-width characters"} 
end

