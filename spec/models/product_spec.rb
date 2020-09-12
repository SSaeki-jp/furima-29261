require 'rails_helper'

RSpec.describe Product, type: :model do
  before do
    @user = FactoryBot.create(:user)
    @product = FactoryBot.build(:product)
  end

  describe '商品出品機能' do
    context '出品がうまくいくとき' do
      it 'すべての項目が入力されているとき登録できる' do
        expect(@product).to be_valid
      end
      it 'priceが300以上のとき登録できる' do
        @product.price = '300'
        expect(@product).to be_valid
      end
      it 'priceが9999999以下のとき登録できる' do
        @product.price = '9999999'
        expect(@product).to be_valid
      end
    end

    context '出品がうまくいかないとき' do
      it 'imageが空だと登録できない' do
        @product.image = nil
        @product.valid?
        expect(@product.errors.full_messages).to include('出品画像を入力してください')
      end

      it 'nameが空だと登録できない' do
        @product.name = ''
        @product.valid?
        expect(@product.errors.full_messages).to include('商品名を入力してください')
      end

      it 'explanationが空だと登録できない' do
        @product.explanation = ''
        @product.valid?
        expect(@product.errors.full_messages).to include('商品の説明を入力してください')
      end

      it 'category_idが空だと登録できない' do
        @product.category_id = ''
        @product.valid?
        expect(@product.errors.full_messages).to include('カテゴリーを選択してください')
      end
      it 'category_idが1だと登録できない' do
        @product.category_id = '1'
        @product.valid?
        expect(@product.errors.full_messages).to include('カテゴリーを選択してください')
      end

      it 'product_status_idが空だと登録できない' do
        @product.product_status_id = ''
        @product.valid?
        expect(@product.errors.full_messages).to include('商品の状態を選択してください')
      end
      it 'product_status_idが1だと登録できない' do
        @product.product_status_id = '1'
        @product.valid?
        expect(@product.errors.full_messages).to include('商品の状態を選択してください')
      end

      it 'shipping_charges_idが空だと登録できない' do
        @product.shipping_charges_id = ''
        @product.valid?
        expect(@product.errors.full_messages).to include('配送料の負担を選択してください')
      end
      it 'shipping_charges_idが1だと登録できない' do
        @product.shipping_charges_id = '1'
        @product.valid?
        expect(@product.errors.full_messages).to include('配送料の負担を選択してください')
      end

      it 'prefecture_idが空だと登録できない' do
        @product.prefecture_id = ''
        @product.valid?
        expect(@product.errors.full_messages).to include('発送元の地域を選択してください')
      end
      it 'prefecture_idが1だと登録できない' do
        @product.prefecture_id = '1'
        @product.valid?
        expect(@product.errors.full_messages).to include('発送元の地域を選択してください')
      end

      it 'estimated_shipping_date_idが空だと登録できない' do
        @product.estimated_shipping_date_id = ''
        @product.valid?
        expect(@product.errors.full_messages).to include('発送までの日数を選択してください')
      end
      it 'estimated_shipping_date_idが1だと登録できない' do
        @product.estimated_shipping_date_id = '1'
        @product.valid?
        expect(@product.errors.full_messages).to include('発送までの日数を選択してください')
      end

      it 'priceが空だと登録できない' do
        @product.price = ''
        @product.valid?
        expect(@product.errors.full_messages).to include('価格を入力してください')
      end
      it 'priceが300未満だと登録できない' do
        @product.price = '299'
        @product.valid?
        expect(@product.errors.full_messages).to include('価格は300以上の値にしてください')
      end
      it 'priceが9999999より大きいと登録できない' do
        @product.price = '10000000'
        @product.valid?
        expect(@product.errors.full_messages).to include('価格は9999999以下の値にしてください')
      end
    end
  end
end
