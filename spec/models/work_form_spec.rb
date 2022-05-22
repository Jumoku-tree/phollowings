require 'rails_helper'

RSpec.describe WorkForm, type: :model do
  before do
    user = FactoryBot.create(:user)
    @work = FactoryBot.build(:work_form)
    @work.user_id = user.id
    @work.images = [fixture_file_upload("/samples/sample.png"), fixture_file_upload("/samples/sample2.png")]
  end

  describe "作品新規投稿" do
    context "作品投稿できるとき" do
      it "すべての情報が正しく入力されていれば作品投稿ができる" do
        @work.valid?
        expect(@work).to be_valid
      end
      
      it "画像が1つでも添付されていれば投稿できる" do
        @work.images[1] = nil
        @work.valid?
        expect(@work).to be_valid
      end

      it "キャプションが空欄でも投稿できる" do
        @work.caption = ""
        @work.valid?
        expect(@work).to be_valid
      end
    end

    context "作品投稿できないとき" do
      it "タイトルが空欄では投稿できない" do
        @work.title = ""
        @work.valid?
        expect(@work.errors.full_messages).to include("Title can't be blank")
      end

      it "カテゴリが空欄では投稿できない" do
        @work.category_id = 1
        @work.valid?
        expect(@work.errors.full_messages).to include("Category can't be blank")

      end

      it "ツールが空欄では投稿できない" do
        @work.tool_id = "1"
        @work.valid?
        expect(@work.errors.full_messages).to include("Tool can't be blank")

      end

      it "ユーザーと紐づいていなければ投稿できない" do
        @work.user_id= ""
        @work.valid?
        expect(@work.errors.full_messages).to include("User can't be blank")
      end

      it "画像が空では投稿できない" do
        @work.images = nil
        @work.valid?
        expect(@work.errors.full_messages).to include("Images can't be blank")
      end
    end
  end

end
