require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end
  describe 'ユーザー新規登録' do

    context 'ユーザ登録ができる時' do
      it '記入項目を入力すれば登録できる' do
        expect(@user).to be_valid
        end
  end

    context 'ユーザ登録ができない時' do
      it 'ニックネームが空なら登録できない' do
      @user.nickname = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Nickname can't be blank")
      end
      it 'メールアドレスが空なら登録できない' do
       @user.email = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Email can't be blank")
      end
      it 'メールアドレスが一意性で無ければ登録できない' do
        @user.save
        another_user = FactoryBot.build(:user)
        another_user.email = @user.email
        another_user.valid?
        expect(another_user.errors.full_messages).to include('Email has already been taken')
      end
      it 'メールアドレスに@を含まれて無ければ登録できない' do
        @user.email = 'aaaa1111'
        @user.valid?
        expect(@user.errors.full_messages).to include("Email is invalid")
      end
      it 'パスワードが空なら登録できない' do
      @user.password = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Password can't be blank")
      end
      it 'パスワードが6文字未満ならば登録できない' do
      @user.password = 'a1'
      @user.valid?
      expect(@user.errors.full_messages).to include("Password is too short (minimum is 6 characters)")
      end
      it 'パスワードが半角英字のみならばば登録できない' do
        @user.password = 'aaaaaaaa'
        @user.valid?
        expect(@user.errors.full_messages).to include("Password is invalid. Include both letters and numbers")
        end
        it 'パスワードが半角数字のみならばば登録できない' do
          @user.password = '11111111'
          @user.valid?
          expect(@user.errors.full_messages).to include("Password is invalid. Include both letters and numbers")
          end
  
      it 'パスワードとパスワード（確認）の値が一致して無ければ登録できない' do
        @user.password = 'aaaaaaaddd1'
          @user.valid?
          expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
        end
      it 'お名前(全角)が空なら登録できない' do
      @user.c_family_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("C family name can't be blank")
      end
      it 'お名前(全角)が空なら登録できない' do
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
      it '名字カナ(全角)が空なら登録できない' do
      @user.k_family_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("K family name can't be blank")
      end
      it '名前カナ(全角)が空なら登録できない' do
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
      it '名字カナ、半角カタカナの場合は登録できない' do
        @user.k_family_name = 'ｶﾀｶﾅ'
        @user.valid?
        expect(@user.errors.full_messages).to include("K family name is invalid. Input full-width katakana characters")
        end
        it '名前カナ、半角カタカナの場合は登録できない' do
        @user.k_first_name = 'ｶﾀｶﾅ'
        @user.valid?
        expect(@user.errors.full_messages).to include("K first name is invalid. Input full-width katakana characters")
        end
        it '名字カナ、半角英字の場合は登録できない' do
          @user.k_family_name = 'nice'
          @user.valid?
          expect(@user.errors.full_messages).to include("K family name is invalid. Input full-width katakana characters")
          end
          it '名前カナ、半角英字の場合は登録できない' do
          @user.k_first_name = 'nice'
          @user.valid?
          expect(@user.errors.full_messages).to include("K first name is invalid. Input full-width katakana characters")
          end
  
  
      it 'birthdayが空なら登録できない' do
      @user.birthday = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Birthday can't be blank")
      end
   end
  end
  pending "add some examples to (or delete) #{__FILE__}"
end
