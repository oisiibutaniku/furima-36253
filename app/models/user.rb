class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

         
         with_options presence: true do
         validates :nickname
         validates :birthday
         validates :password, format:{with: /(?=.*[a-zA-Z])(?=.*\d)[a-zA-Z\d]/, message: "is invalid. Include both letters and numbers"} #半角英数字
         with_options format: {with: /\A[ぁ-んァ-ン一-龥々ー]+\z/, message: "is invalid. Input full-width characters"} do#全角オンリー
          validates :c_family_name
          validates :c_first_name
         end
        with_options format: {with: /\A[\p{katakana}　ー－&&[^ -~｡-ﾟ]]+\z/, message: "is invalid. Input full-width katakana characters"} do#カタカナオンリー
          validates :k_family_name
          validates :k_first_name
        end
      end

end
