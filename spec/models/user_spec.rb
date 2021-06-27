require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe "ユーザー新規登録" do
    it "nicknameが空では登録できないこと" do
      @user.nickname = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Nickname can't be blank")
    end

    it "emailが空では登録できないこと" do
      @user.email = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Email can't be blank")
    end
    it "重複したメールアドレスが存在する場合登録できないこと" do
      @user.save
      another_user = FactoryBot.build(:user, email: @user.email)
      another_user.valid?
      expect(another_user.errors.full_messages).to include("Email has already been taken")
    end
    it "メールアドレスは、@を含む必要があること" do
      @user.email = 'testgmail.com'
      @user.valid?
      expect(@user.errors.full_messages).to include("Email is invalid")
    end

    it "passwordが空では登録できないこと" do
      @user.password = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Password can't be blank")
    end
    it "passwordが5文字以下であれば登録できないこと" do
      @user.password = '12345'
      @user.password_confirmation = '12345'
      @user.valid?
      expect(@user.errors.full_messages).to include("Password is too short (minimum is 6 characters)")
    end
    it "passwordは半角数字のみでは登録できないこと" do
      @user.password = '123456'
      @user.password_confirmation = '123456'
      @user.valid?
      expect(@user.errors.full_messages).to include("Password is invalid. Input half-width alphanumeric characters.")
    end
    it "passwordは半角英数混合(半角英語のみ)では登録できないこと" do
      @user.password = 'abcdef'
      @user.password_confirmation = 'abcdef'
      @user.valid?
      expect(@user.errors.full_messages).to include("Password is invalid. Input half-width alphanumeric characters.")
    end
    it 'passwordは全角英数混合では登録できないこと' do
      @user.password = '１２３ａｂｃ'
      @user.password_confirmation = '１２３ａｂｃ'
      @user.valid?
      expect(@user.errors.full_messages).to include("Password is invalid. Input half-width alphanumeric characters.")
    end
    it "passwordが存在してもpassword_confirmationが空では登録できないこと" do
      @user.password_confirmation = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
    end
    it 'passwordとpassword_confirmationが不一致では登録できないこと' do
      @user.password = '123abc'
      @user.password_confirmation = '123abcd'
      @user.valid?
      expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
    end

    it "苗字が空では登録できないこと" do
      @user.last_name = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Last name can't be blank")
    end
    it "苗字は、漢字・平仮名・カタカナ以外では登録できないこと" do
      @user.last_name = 'tanaka'
      @user.valid?
      expect(@user.errors.full_messages).to include("Last name is invalid. Input full-width characters.")
    end
    it "名前が空では登録できないこと" do
      @user.first_name = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("First name can't be blank")
    end
    it "名前は、漢字・平仮名・カタカナ以外では登録できないこと" do
      @user.first_name = 'kazumasa'
      @user.valid?
      expect(@user.errors.full_messages).to include("First name is invalid. Input full-width characters.")
    end


    it "苗字カタカナが空では登録できないこと" do
      @user.last_name_kana = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Last name kana can't be blank")
    end
    it "苗字カタカナは、全角カタカナ以外では登録できないこと" do
      @user.last_name_kana = 'たなか'
      @user.valid?
      expect(@user.errors.full_messages).to include("Last name kana is invalid. Input full-width katakana characters.")
    end
    it "名前カタカナが空では登録できないこと" do
      @user.first_name_kana = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("First name kana can't be blank")
    end
    it "名前カタカナは、全角カタカナ以外では登録できないこと" do
      @user.first_name_kana = 'かずまさ'
      @user.valid?
      expect(@user.errors.full_messages).to include("First name kana is invalid. Input full-width katakana characters.")
    end

    it "誕生日が空では登録できないこと" do
      @user.birthday = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Birthday can't be blank")
    end

  end
end