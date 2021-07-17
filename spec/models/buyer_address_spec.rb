require 'rails_helper'

RSpec.describe BuyerAddress, type: :model do
  before do
    user = FactoryBot.create(:user)
    item = FactoryBot.create(:item)
    @buyer_address = FactoryBot.build(:buyer_address, user_id: user.id, item_id: item.id)
    sleep 0.1
  end

  describe "購入情報の保存" do

    context "購入情報が保存できる場合" do
      it "すべての値が正しく入力されていれば保存できること" do
        expect(@buyer_address).to be_valid
      end

      it '建物名は空でも保存できること' do
        @buyer_address.building_name = ''
        expect(@buyer_address).to be_valid
      end
    end

    context "購入情報が保存できない場合" do
      it "郵便番号が空では保存できないこと" do
        @buyer_address.postal_code = ''
        @buyer_address.valid?
        expect(@buyer_address.errors.full_messages).to include("Postal code can't be blank")
      end
      it "郵便番号が半角のハイフンを含んだ正しい形式でないと保存できないこと" do
        @buyer_address.postal_code = '1234567'
        @buyer_address.valid?
        expect(@buyer_address.errors.full_messages).to include("Postal code is invalid. Enter it as follows (e.g. 123-4567)")
      end

      it "都道府県を選択していないと保存できないこと" do
        @buyer_address.item_location_id = 0
        @buyer_address.valid?
        expect(@buyer_address.errors.full_messages).to include("Item location can't be blank")
      end

      it "番地が空では保存できないこと" do
        @buyer_address.house_number = ''
        @buyer_address.valid?
        expect(@buyer_address.errors.full_messages).to include("House number can't be blank")
      end

      it "電話番号は11桁以内の数値のみ保存可能なこと" do
        @buyer_address.tel = '080123456789'
        @buyer_address.valid?
        expect(@buyer_address.errors.full_messages).to include("Tel is invalid. Input only number")
      end

      it "ユーザー情報がない場合は保存できないこと" do
        @buyer_address.user_id = nil
        @buyer_address.valid?
        expect(@buyer_address.errors.full_messages).to include("User can't be blank")
      end

      it "商品情報がない場合は保存できないこと" do
        @buyer_address.item_id = nil
        @buyer_address.valid?
        expect(@buyer_address.errors.full_messages).to include("Item can't be blank")
      end

      it "tokenが空では保存できないこと" do
        @buyer_address.token = nil
        @buyer_address.valid?
        expect(@buyer_address.errors.full_messages).to include("Token can't be blank")
      end
    end
  end
end
