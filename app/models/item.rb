class Item < ApplicationRecord
  
  belongs_to :user
  has_one_attached :image
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :state
  belongs_to :burden
  belongs_to :prefecture
  belongs_to :day

  with_options presence: true do
validates :product
validates :explanation
validates :price
validates :image
validates :category_id, :state_id,:burden_id,:prefecture_id,:day_id
  end
#ジャンルの選択が「--」の時は保存できないようにする
validates :category_id, numericality: { other_than: 1 , message: "can't be blank"} 
validates :state_id, numericality: { other_than: 1 , message: "can't be blank"}
validates :burden_id, numericality: { other_than: 1 , message: "can't be blank"}
validates :prefecture_id, numericality: { other_than: 1 , message: "can't be blank"}
validates :day_id, numericality: { other_than: 1 , message: "can't be blank"}

validates :price, inclusion: { in: 300..9_999_999, message: "is out of setting range"}
validates :price, numericality: { only_integer: true,message: "is invalid. Input half-width characters"} 
end

