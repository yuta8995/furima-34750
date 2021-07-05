require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end

  describe "商品情報の登録" do

    context "商品情報が登録できる場合" do
      it "必要な情報を適切に入力すると、商品情報がデータベースに保存されること" do
        expect(@item).to be_valid
      end
    end

    context "商品情報が登録できない場合" do
        it "商品画像が空では登録できないこと" do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Image can't be blank")
      end

      it "商品名が空では登録できないこと" do
        @item.item_name = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Item name can't be blank")
      end

      it "商品の説明が空では登録できないこと" do
        @item.item_description = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Item description can't be blank")
      end

      it "カテゴリーが未選択では登録できないこと" do
        @item.category_id = 0
        @item.valid?
        expect(@item.errors.full_messages).to include("Category can't be blank")
      end

      it "商品の状態が未選択では登録できないこと" do
        @item.item_condition_id = 0
        @item.valid?
        expect(@item.errors.full_messages).to include("Item condition can't be blank")
      end

      it "配送料の負担が未選択では登録できないこと" do
        @item.shipping_paid_by_id = 0
        @item.valid?
        expect(@item.errors.full_messages).to include("Shipping paid by can't be blank")
      end

      it "発送元の地域が未選択では登録できないこと" do
        @item.item_location_id = 0
        @item.valid?
        expect(@item.errors.full_messages).to include("Item location can't be blank")
      end

      it "発送までの日数が未選択では登録できないこと" do
        @item.shipping_date_id = 0
        @item.valid?
        expect(@item.errors.full_messages).to include("Shipping date can't be blank")
      end

      it "販売価格が空では登録できないこと" do
        @item.price = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Price can't be blank")
      end
      it "販売価格が全角数字では登録できないこと" do
        @item.price = "９９９９"
        @item.valid?
        expect(@item.errors.full_messages).to include("Price is out of setting range")
      end
      it "販売価格が半角英数混合では登録できないこと" do
        @item.price = "1a2b"
        @item.valid?
        expect(@item.errors.full_messages).to include("Price is out of setting range")
      end
      it "販売価格が半角英語では登録できないこと" do
        @item.price = "abcd"
        @item.valid?
        expect(@item.errors.full_messages).to include("Price is out of setting range")
      end
      it "販売価格が299円以下では登録できないこと" do
        @item.price = "299"
        @item.valid?
        expect(@item.errors.full_messages).to include("Price is out of setting range")
      end
      it "販売価格が10,000,000以上では登録できないこと" do
        @item.price = "10000000"
        @item.valid?
        expect(@item.errors.full_messages).to include("Price is out of setting range")
      end
    end
  end
end
