class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable  #, :validatable

         
         validates :nickname, presence: true
         validates :email, presence: true
         validates :birthday, presence: true
         validates :password, presence: true, length: { minimum: 6 }
         validates :email, inclusion: { in: %w(@) }

         validates :password,
         format:{with: /(?=.*[a-zA-Z])(?=.*\d)[a-zA-Z\d]{7,}/,
         message: "is invalid. Include both letters and numbers"}#半角英数字

         validates :c_family_name, :c_first_name, presence: true,
         format: {with: /[^ -~｡-ﾟ]+/,
          message: "is invalid. Input full-width characters"}#全角オンリー

         validates :k_family_name, :k_first_name, presence: true,
         format: {with: /\A[\p{katakana}　ー－&&[^ -~｡-ﾟ]]+\z/,
          message: "is invalid. Input full-width katakana characters"}#カタカナオンリー

end
