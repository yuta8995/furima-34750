require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end
  describe "商品情報の登録" do
    it "商品画像が空では出品できないこと" do
      @item.image = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Image can't be blank")
    end

    it "商品名が空では出品できないこと" do
      @item.item_name = ''
      @item.valid?
      expect(@item.errors.full_messages).to include("Item name can't be blank")
    end

    it "商品の説明が空では出品できないこと" do
      @item.item_description = ''
      @item.valid?
      expect(@item.errors.full_messages).to include("Item description can't be blank")
    end

    it "カテゴリーが未選択では出品できないこと" do
      @item.category_id = 0
      @item.valid?
      expect(@item.errors.full_messages).to include("Category can't be blank")
    end

    it "商品の状態が未選択では出品できないこと" do
      @item.item_condition_id = 0
      @item.valid?
      expect(@item.errors.full_messages).to include("Item condition can't be blank")
    end

    it "配送料の負担が未選択では出品できないこと" do
      @item.shipping_paid_by_id = 0
      @item.valid?
      expect(@item.errors.full_messages).to include("Shipping paid by can't be blank")
    end

    it "発送元の地域が未選択では出品できないこと" do
      @item.item_location_id = 0
      @item.valid?
      expect(@item.errors.full_messages).to include("Item location can't be blank")
    end

    it "発送までの日数が未選択では出品できないこと" do
      @item.shipping_date_id = 0
      @item.valid?
      expect(@item.errors.full_messages).to include("Shipping date can't be blank")
    end

    it "販売価格が空では出品できないこと" do
      @item.price = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Price can't be blank")
    end

  end
end
