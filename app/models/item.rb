class Item < ApplicationRecord
  
  belongs_to :user
  has_one_attached :image
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :state
  belongs_to :burden
  belongs_to :prefecture
  belongs_to :day


validates :product, presence: true
validates :explanation, presence: true
validates :price, presence: true
validates :image, presence: true
validates :category_id, :state_id,:burden_id,:prefecture_id,:day_id, presence: true
#ジャンルの選択が「--」の時は保存できないようにする
validates :category_id, numericality: { other_than: 1 , message: "can't be blank"} 
validates :state_id, numericality: { other_than: 1 , message: "can't be blank"}
validates :burden_id, numericality: { other_than: 1 , message: "can't be blank"}
validates :prefecture_id, numericality: { other_than: 1 , message: "can't be blank"}
validates :day_id, numericality: { other_than: 1 , message: "can't be blank"}


end

