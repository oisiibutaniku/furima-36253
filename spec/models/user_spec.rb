require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end
  describe 'ユーザー新規登録' do
    it 'nickname:必須' do
      @user.nickname = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Nickname can't be blank")
    end
    it 'email:必須' do
      @user.email = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Email can't be blank")
    end
    it 'emailが一意性で無ければ登録できない' do
    end
    it 'emailに@を含まれて無ければ登録できない' do
    end
    it 'password:必須' do
      @user.password = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Password can't be blank")
    end
    it 'passwordが6文字未満ならば登録できない' do
      @user.password = 'a1'
      @user.valid?
      expect(@user.errors.full_messages).to include("Password is too short (minimum is 6 characters)")

    end
    it 'passwordが半角英数字混合で無ければ登録できない' do
      @user.password = 'aaaaaaaa'
      @user.valid?
      expect(@user.errors.full_messages).to include("Password is invalid. Include both letters and numbers")

    end
    it 'パスワードとパスワード（確認）の値の一致しなければ登録できない' do
    end
    it 'お名前(全角)、c_family_name:必須' do
      @user.c_family_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("C family name can't be blank")
    end
    it 'お名前(全角)、c_first_name:必須' do
      @user.c_first_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("C first name can't be blank")
    end
    it '苗字(全角)、全角（漢字・ひらがな・カタカナ）入力が必須' do
      @user.c_family_name = 'aaa'
      @user.valid?
      expect(@user.errors.full_messages).to include("C family name is invalid. Input full-width characters")

    end
    it '名前(全角)、全角（漢字・ひらがな・カタカナ）入力が必須' do
      @user.c_first_name = 'aaa'
      @user.valid?
      expect(@user.errors.full_messages).to include("C first name is invalid. Input full-width characters")

    end
    it '名字カナ(全角):必須' do
      @user.k_family_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("K family name can't be blank")
    end
    it '名前カナ(全角):必須' do
      @user.k_first_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("K first name can't be blank")
    end
    it '名字カナ、全角（カタカナ）入力が必須' do
      @user.k_family_name = '田中'
      @user.valid?
      expect(@user.errors.full_messages).to include("K family name is invalid. Input full-width katakana characters")
    end
    it '名前カナ、全角（カタカナ）入力が必須' do
      @user.k_first_name = '太郎'
      @user.valid?
      expect(@user.errors.full_messages).to include("K first name is invalid. Input full-width katakana characters")
    end
    it 'birthday:必須' do
      @user.birthday = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Birthday can't be blank")
    end



  end



  pending "add some examples to (or delete) #{__FILE__}"
end
