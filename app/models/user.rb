class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

         
         with_options presence: true do
          validates :nickname,:birthday
         

         validates :password, presence: true,
         format:{with: /(?=.*[a-zA-Z])(?=.*\d)[a-zA-Z\d]{7,}/,
         message: "is invalid. Include both letters and numbers"}#半角英数字

         validates :c_family_name, :c_first_name, presence: true,
         format: {with: /\A[ぁ-んァ-ン一-龥々ー]+\z/,
          message: "is invalid. Input full-width characters"}#全角オンリー

         validates :k_family_name, :k_first_name, presence: true,
         format: {with: /\A[\p{katakana}　ー－&&[^ -~｡-ﾟ]]+\z/,
          message: "is invalid. Input full-width katakana characters"}#カタカナオンリー
        end

end
