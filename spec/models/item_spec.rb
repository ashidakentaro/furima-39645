require 'rails_helper'
RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end

  describe '商品の出品' do
    context '商品の出品ができるとき' do
      it 'title, explanation, price, category, condition, charge, leadtimeが存在し、ログインユーザーとの関連性があれば登録できる' do
        expect(@item).to be_valid
      end
    end
    context '商品の出品ができないとき' do
      it 'image画像を載せないと登録できない' do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include "Image can't be blank"
      end
      it 'titleが空では登録できない' do
        @item.title = ''
        @item.valid?
        expect(@item.errors.full_messages).to include "Title can't be blank"
      end
      it 'explanationが空では登録できない' do
        @item.explanation = ''
        @item.valid?
        expect(@item.errors.full_messages).to include "Explanation can't be blank"
      end
      it 'priceが空では登録できない' do
        @item.price = ''
        @item.valid?
        expect(@item.errors.full_messages).to include "Price can't be blank"
      end
      it 'priceの値が299以下では登録できない' do
        @item.price = '299'
        @item.valid?
        expect(@item.errors.full_messages).to include "Price is out of setting range"
      end
      it 'priceの値が9999999以上では登録できない' do
        @item.price = '10000000'
        @item.valid?
        expect(@item.errors.full_messages).to include "Price is out of setting range"
      end
      it 'priceの値が半角数字でないと登録できない' do
        @item.price = '３００'
        @item.valid?
        expect(@item.errors.full_messages).to include "Price is out of setting range"
      end
      it 'categoryが無選択だと登録できない' do
        @item.category_id = '1'
        @item.valid?
        expect(@item.errors.full_messages).to include "Category must be other than 1"
      end
      it 'conditionが無選択だと登録できない' do
        @item.condition_id = '1'
        @item.valid?
        expect(@item.errors.full_messages).to include "Condition must be other than 1"
      end
      it 'chargeが無選択だと登録できない' do
        @item.charge_id = '1'
        @item.valid?
        expect(@item.errors.full_messages).to include "Charge must be other than 1"
      end
      it 'prefectureが無選択だと登録できない' do
        @item.prefecture_id = '1'
        @item.valid?
        expect(@item.errors.full_messages).to include "Prefecture must be other than 1"
      end
      it 'leadtimeが無選択だと登録できない' do
        @item.leadtime_id = '1'
        @item.valid?
        expect(@item.errors.full_messages).to include "Leadtime must be other than 1"
      end
      it '商品とユーザーの関連性がないと登録できない' do
        @item.user_id = 'nil'
        @item.valid?
        expect(@item.errors.full_messages).to include "User must exist"
      end
    end
  end
end
