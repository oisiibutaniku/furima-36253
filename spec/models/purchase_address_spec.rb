require 'rails_helper'

RSpec.describe PurchaseAddress, type: :model do
  require 'rails_helper'
  before do
    @user = FactoryBot.create(:user)
    @item = FactoryBot.build(:item)
    @item.image = fixture_file_upload('app/assets/images/food_box.png')
        @item.save
        @purchase_address = FactoryBot.build(:purchase_address, user_id: @user.id, item_id: @item.id)
        sleep(1)
  end
  describe '商品の購入' do

    context '商品が購入できる時' do
      it '記入項目を入力すれば購入できる' do
        expect(@purchase_address).to be_valid
        end
      it '建物名は入力しなくても購入できる' do
        @purchase_address.building = ''
        expect(@purchase_address).to be_valid
        end
        

    end

    context '商品が購入できない時' do
      it 'クレジット情報が空なら購入できない' do
        @purchase_address.token = ''
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("Token can't be blank")
      end
      it '郵便番号が空なら購入できない' do
        @purchase_address.postal_code = ''
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("Postal code is invalid. Enter it as follows (e.g. 123-4567)")
      end
      it '都道府県が未選択なら購入できない' do
        @purchase_address.prefecture_id = 1
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("Prefecture can't be blank")
      end
      it '市町村の項目が空なら購入できない' do
        @purchase_address.city = ''
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("City can't be blank")
      end
      it '番地の項目が空なら購入できない' do
        @purchase_address.street = ''
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("Street can't be blank")
      end
      it '電話番号の項目が空なら購入できない' do
        @purchase_address.phone = ''
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("Phone can't be blank")
      end
      it '郵便番号は,ハイフンがなければなければ購入できない' do
        @purchase_address.postal_code = '1234567'
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("Postal code is invalid. Enter it as follows (e.g. 123-4567)")
      end
      it '郵便番号は,全角英数字では購入できない' do
        @purchase_address.postal_code = '１２３ーABCD'
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("Postal code is invalid. Enter it as follows (e.g. 123-4567)")
      end
      it '電話番号は10桁以下なら購入できない' do
        @purchase_address.phone = '090'
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("Phone is too short (minimum is 10 characters)")
        end
      it '電話番号は11桁以上なら購入できない' do
        @purchase_address.phone = '090123456789'
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("Phone is too long (maximum is 11 characters)")
      end
      it '電話番号が全角数字なら購入できない' do
        @purchase_address.phone = '０９０１２３４５６７８'
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("Phone number is invalid. Input only number")
      end
      it '電話番号が半角英字なら購入できない' do
        @purchase_address.phone = 'asdfghjkwer'
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("Phone number is invalid. Input only number")
      end
   end
  end

  pending "add some examples to (or delete) #{__FILE__}"
end

