require 'rails_helper'

RSpec.describe PurchaseForm, type: :model do
  before do
    @user = FactoryBot.create(:user)
    @item = FactoryBot.create(:item)
    @purchase_form = FactoryBot.build(:purchase_form, user_id: @user.id, item_id: @item.id)
  end
  describe '商品購入機能' do
    context '購入できる場合' do
      it '全てのデータが存在すれば保存できる' do
        expect(@purchase_form).to be_valid
      end
      it ' building_nameは空でも保存できる' do
        @purchase_form.building_name = ''
        expect(@purchase_form).to be_valid
      end
    end
    context '購入できない場合' do
      it 'tokenが空では保存できないこと' do
        @purchase_form.token = nil
        @purchase_form.valid?
        expect(@purchase_form.errors.full_messages).to include("Token can't be blank")
      end
      it 'postal_codeが空では保存できない' do
        @purchase_form.postal_code = nil
        @purchase_form.valid?
        expect(@purchase_form.errors.full_messages).to include ("Postal code can't be blank")
      end
      it 'postal_codeが正しいフォーマットでないと保存できない' do
        @purchase_form.postal_code = '1234567'
        @purchase_form.valid?
        expect(@purchase_form.errors.full_messages).to include ("Postal code is invalid. Enter it as follows (e.g. 123-4567)")
      end
      it 'prefectureが空では保存できない' do
        @purchase_form.prefecture_id = 1
        @purchase_form.valid?
        expect(@purchase_form.errors.full_messages).to include ("Prefecture can't be blank")
      end
      it 'cityが空では保存できない' do
        @purchase_form.city = nil
        @purchase_form.valid?
        expect(@purchase_form.errors.full_messages).to include ("City can't be blank")
      end
      it 'house_numberが空では保存できない' do
        @purchase_form.house_number = nil
        @purchase_form.valid?
        expect(@purchase_form.errors.full_messages).to include ("House number can't be blank")
      end
      it 'telephone_numberが空では保存できない' do
        @purchase_form.telephone_number = nil
        @purchase_form.valid?
        expect(@purchase_form.errors.full_messages).to include ("Telephone number can't be blank")
      end
      it 'telephone_numberが9桁以下では保存できない' do
        @purchase_form.telephone_number = '123456789'
        @purchase_form.valid?
        expect(@purchase_form.errors.full_messages).to include ("Telephone number is invalid. Enter 10 or 11 digits without hyphens")
      end
      it 'telephone_numberが12桁以上では保存できない' do
        @purchase_form.telephone_number = '090123456789'
        @purchase_form.valid?
        expect(@purchase_form.errors.full_messages).to include ("Telephone number is invalid. Enter 10 or 11 digits without hyphens")
      end
      it 'telephone_numberが半角数値以外では保存できない' do
        @purchase_form.telephone_number = '０９０１２３４５６７８９'
        @purchase_form.valid?
        expect(@purchase_form.errors.full_messages).to include ("Telephone number is invalid. Enter 10 or 11 digits without hyphens")
      end
      it 'user_idが空では保存できない' do
        @purchase_form.user_id = nil
        @purchase_form.valid?
        expect(@purchase_form.errors.full_messages).to include ("User can't be blank")
      end
      it 'item_idが空では保存できない' do
        @purchase_form.item_id = nil
        @purchase_form.valid?
        expect(@purchase_form.errors.full_messages).to include ("Item can't be blank")
      end
    end
  end
end
