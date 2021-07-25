require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
      @item.image = fixture_file_upload('app/assets/images/food_box.png')
end
  describe '商品の新規登録' do

    context '商品の登録ができる時' do
      it '記入項目を入力すれば登録できる' do
        expect(@item).to be_valid
        end
  end

    context '商品の登録ができない時' do
      it '商品画像が空なら登録できない' do
      @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Image can't be blank")
      end
      it '商品名が空なら登録できない' do
       @item.product = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Product can't be blank")
      end
      it '商品の説明が空なら登録できない' do
      @item.explanation = ''
      @item.valid?
      expect(@item.errors.full_messages).to include("Explanation can't be blank")
      end
      it '商品のカテゴリーが初期値なら登録できない' do
      @item.category_id = '1'
      @item.valid?
      expect(@item.errors.full_messages).to include("Category can't be blank")
      end
      it '商品の状態が初期値なら登録できない' do
      @item.state_id = '1'
      @item.valid?
      expect(@item.errors.full_messages).to include("State can't be blank")
      end
      it '配送料の負担が初期値なら登録できない' do
      @item.burden_id = '1'
      @item.valid?
      expect(@item.errors.full_messages).to include("Burden can't be blank")
      end
      it '発送元の地域が初期値なら登録できない' do
      @item.prefecture_id = '1'
      @item.valid?
      expect(@item.errors.full_messages).to include("Prefecture can't be blank")
      end
      it '発送までの日数が初期値なら登録できない' do
      @item.day_id = '1'
      @item.valid?
      expect(@item.errors.full_messages).to include("Day can't be blank")
      end
  
      it '価格が空なら登録できない' do
      @item.price = ''
      @item.valid?
      expect(@item.errors.full_messages).to include("Price can't be blank")
        end
      it '価格が半角英字を含んでいるなら登録できない' do
        @item.price = '1000a'
        @item.valid?
        expect(@item.errors.full_messages).to include("Price is invalid. Input half-width characters")
        end
        it '価格が全角を含んでいるなら登録できない' do
          @item.price = '1000０A'
          @item.valid?
          expect(@item.errors.full_messages).to include("Price is invalid. Input half-width characters")
          end
   end
  end

  pending "add some examples to (or delete) #{__FILE__}"
end
