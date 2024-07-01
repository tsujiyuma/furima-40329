require 'rails_helper'

RSpec.describe OrderPurchase, type: :model do
  before do
    @order_purchase = OrderPurchase.new(user_id: 1, item_id: 1, token: 'tok_visa')
    @purchase = FactoryBot.build(:order_purchase)
  end

  describe '購入処理' do
    context '購入処理がうまくいく時' do
      it '購入処理がうまくいく時' do
        expect(@purchase).to(be_valid)
      end
    end

    context '購入処理がうまくいかない時' do
      it 'カード情報に不備がある' do
        @order_purchase.token = ''
        @order_purchase.valid?
        expect(@order_purchase.errors.full_messages).to include("Token can't be blank")
      end

      it '郵便番号が空欄でないこと' do
        @purchase.post_code = ''
        @purchase.valid?
        expect(@purchase.errors.full_messages).to include("Post code can't be blank")
      end

      it '郵便番号が（数字３桁 - 数字４桁）の形になっていること' do
        @purchase.post_code = '1234-567'
        @purchase.valid?
        expect(@purchase.errors.full_messages).to include('Post code はハイフンを含む7桁の数字で入力してください')
      end

      it '都道府県が---でないこと' do
        @purchase.prefecture_id = 0
        @purchase.valid?
        expect(@purchase.errors.full_messages).to include("Prefecture can't be blank")
      end

      it '市区町村が空欄でないこと' do
        @purchase.municipality = ''
        @purchase.valid?
        expect(@purchase.errors.full_messages).to include("Municipality can't be blank")
      end

      it '番地が空欄' do
        @purchase.street_addres = ''
        @purchase.valid?
        expect(@purchase.errors.full_messages).to include("Street addres can't be blank")
      end

      it '電話番号が空欄' do
        @purchase.photo_num = ''
        @purchase.valid?
        expect(@purchase.errors.full_messages).to include("Photo num can't be blank")
      end

      it '電話番号が全角数字入力されている' do
        @purchase.photo_num = '０１２０００００００'
        @purchase.valid?
        expect(@purchase.errors.full_messages).to include('Photo num は半角数字で入力してください')
      end

      it '電話番号の桁数が少ない' do
        @purchase.photo_num = 0o012000000
        @purchase.valid?
        expect(@purchase.errors.full_messages).to include('Photo num is too short (minimum is 10 characters)')
      end

      it '電話番号が数字以外が入力されている' do
        @purchase.photo_num = 'a123456789'
        @purchase.valid?
        expect(@purchase.errors.full_messages).to include('Photo num is not a number')
      end
    end
  end
end
