require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe "ユーザー新規登録" do
    context "新規登録できるとき" do
      it "すべての情報が正しく入力されていれば新規登録できる" do
        @user.valid?
        expect(@user).to be_valid
      end

      it "プロフィールが空欄でも新規登録できる" do
        @user.profile = ""
        @user.valid?
        expect(@user).to be_valid
      end
    end

    context "新規登録できないとき" do
      it "nameが空では新規登録できない" do
        @user.name = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Name can't be blank")
      end

      it "emailが空では新規登録できない" do
        @user.email = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Email can't be blank")

      end

      it "passwordが空では新規登録できない" do
        @user.password = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Password can't be blank")

      end

      it "password_confirmationが空では登録できない" do
        @user.password_confirmation = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")

      end

      it "passwordとpassword_confirmationが不一致では登録できない" do
        @user.password = "abcd1234"
        @user.password_confirmation = "efgh9876"
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")

      end

      it "nameが11字以上では登録できない" do
        @user.name = "123456789012"
        @user.valid?
        expect(@user.errors.full_messages).to include("Name must be within 10 characters")

      end

      it "emailに@が含まれていないと登録できない" do
        @user.email = "example"
        @user.valid?
        expect(@user.errors.full_messages).to include("Email is invalid")

      end

      it "パスワードが7字以下では登録できない" do
        @user.password = "1234567"
        @user.valid?
        expect(@user.errors.full_messages).to include("Password must be 8 characters or more")

      end

    end
  end
end
require 'rails_helper'
