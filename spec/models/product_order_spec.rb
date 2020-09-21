require 'rails_helper'

RSpec.describe ProductOrder, type: :model do
  before do
    @product_order = FactoryBot.build(:product_order)
  end
  describe 'トークンの生成、配送先情報と注文情報の保存' do
    context '保存がうまくいくとき' do
      it 'すべての値が正しく入力されているとき保存できる' do
        expect(@product_order).to be_valid
      end

      it '建物名が存在しなくても保存できる' do
        @product_order.building_name = ''
        expect(@product_order).to be_valid
      end
    end

    context '保存がうまくいかないとき' do
      it 'tokenが空だと保存できない（PAY.JPのAPIによって作成されるため、空の場合以外のケースは割愛）' do
        @product_order.token = ''
        @product_order.valid?
        expect(@product_order.errors.full_messages).to include('クレジットカード情報を入力してください')
      end

      it 'postal_codeが空だと保存できない' do
        @product_order.postal_code = ''
        @product_order.valid?
        expect(@product_order.errors.full_messages).to include('郵便番号を入力してください', '郵便番号は「-」を含む7桁で入力してください')
      end
      it 'postal_codeに"-"が含まれていないと保存できない' do
        @product_order.postal_code = '1234567'
        @product_order.valid?
        expect(@product_order.errors.full_messages).to include('郵便番号は「-」を含む7桁で入力してください')
      end
      it 'postal_codeが「3桁半角数字以外+"-"+4桁半角数字」だと保存できない' do
        @product_order.postal_code = '12-3456'
        @product_order.valid?
        expect(@product_order.errors.full_messages).to include('郵便番号は「-」を含む7桁で入力してください')
      end
      it 'postal_codeが「3桁半角数字+"-"+4桁半角数字以外」空だと保存できない' do
        @product_order.postal_code = '123-456'
        @product_order.valid?
        expect(@product_order.errors.full_messages).to include('郵便番号は「-」を含む7桁で入力してください')
      end

      it 'prefecture_idが空だと保存できない' do
        @product_order.prefecture_id = ''
        @product_order.valid?
        expect(@product_order.errors.full_messages).to include('都道府県を選択してください')
      end
      it 'prefecture_idが1だと保存できない' do
        @product_order.prefecture_id = '1'
        @product_order.valid?
        expect(@product_order.errors.full_messages).to include('都道府県を選択してください')
      end
      
      it 'cityが空だと保存できない' do
        @product_order.city = ''
        @product_order.valid?
        expect(@product_order.errors.full_messages).to include('市区町村を入力してください')
      end

      it 'addressが空だと保存できない' do
        @product_order.address = ''
        @product_order.valid?
        expect(@product_order.errors.full_messages).to include('番地を入力してください')
      end

      it 'phone_numberが空だと保存できない' do
        @product_order.phone_number = ''
        @product_order.valid?
        expect(@product_order.errors.full_messages).to include('電話番号を入力してください')
      end
      it 'phone_numberが半角数字以外だと保存できない' do
        @product_order.phone_number = '０１２３４５６７８９'
        @product_order.valid?
        expect(@product_order.errors.full_messages).to include('電話番号は半角数字で入力してください')
      end
      it 'phone_numberに記号が含まれていると保存できない' do
        @product_order.phone_number = '012-345-678'
        @product_order.valid?
        expect(@product_order.errors.full_messages).to include('電話番号は半角数字で入力してください')
      end
    end
  end
end
