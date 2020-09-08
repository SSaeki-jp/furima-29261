require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザ管理機能' do
    context '新規登録がうまくいくとき' do
      it "全カラムの情報が存在するとき登録できる" do
        expect(@user).to be_valid
      end
      it "passwordが6文字以上のとき登録できる" do
        @user.password = "123asd"
        @user.password_confirmation = "123asd"
        expect(@user).to be_valid
      end
    end

    context '新規登録がうまくいかないとき' do
      it "nicknameが空だと登録できない" do
        @user.nickname = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Nickname can't be blank")
      end

      it "emailが空だと登録できない" do
        @user.email = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Email can't be blank")
      end

      it "passwordが空だと登録できない" do
        @user.password = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Password can't be blank")
      end
      it "passwordが英数字混合でないと登録できない" do
        @user.password = "123456"
        @user.password_confirmation = "123456"
        @user.valid?
        expect(@user.errors.full_messages).to include()
      end
      it "passwordが5文字以下だと登録できない" do
        @user.password = "123as"
        @user.password_confirmation = "123as"
        @user.valid?
        expect(@user.errors.full_messages).to include("Password is too short (minimum is 6 characters)")
      end
      it "passwordが存在してもpassword_confirmationが空だと登録できない" do
        @user.password_confirmation = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end

      it "lastname_fullwidth_kanjiが空だと登録できない" do
        @user.lastname_fullwidth_kanji = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Lastname fullwidth kanji can't be blank")
      end
      it "lastname_fullwidth_kanjiが半角文字だと登録できない" do
        @user.lastname_fullwidth_kanji = "aaaa"
        @user.valid?
        expect(@user.errors.full_messages).to include("Lastname fullwidth kanji 全角文字を使用してください")
      end

      it "firstname_fullwidth_kanjiが空だと登録できない" do
        @user.firstname_fullwidth_kanji = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Firstname fullwidth kanji can't be blank")
      end
      it "firstname_fullwidth_kanjiが半角文字だと登録できない" do
        @user.firstname_fullwidth_kanji = "bbbb"
        @user.valid?
        expect(@user.errors.full_messages).to include("Firstname fullwidth kanji 全角文字を使用してください")
      end

      it "lastname_fullwidth_katakanaが空だと登録できない" do
        @user.lastname_fullwidth_katakana = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Lastname fullwidth katakana can't be blank")
      end
      it "lastname_fullwidth_katakanaが半角文字だと登録できない" do
        @user.lastname_fullwidth_katakana = "cccc"
        @user.valid?
        expect(@user.errors.full_messages).to include("Lastname fullwidth katakana カタカナを使用してください")
      end
      it "lastname_fullwidth_katakanaがカタカナ以外の全角文字だと登録できない" do
        @user.lastname_fullwidth_katakana = "一二三"
        @user.valid?
        expect(@user.errors.full_messages).to include("Lastname fullwidth katakana カタカナを使用してください")
      end

      it "firstname_fullwidth_katakanaが空だと登録できない" do
        @user.firstname_fullwidth_katakana = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Firstname fullwidth katakana can't be blank")
      end
      it "firstname_fullwidth_katakanaが半角文字だと登録できない" do
        @user.firstname_fullwidth_katakana = "dddd"
        @user.valid?
        expect(@user.errors.full_messages).to include("Firstname fullwidth katakana カタカナを使用してください")
      end
      it "firstname_fullwidth_katakanaがカタカナ以外の全角文字だと登録できない" do
        @user.firstname_fullwidth_katakana = "四五六"
        @user.valid?
        expect(@user.errors.full_messages).to include("Firstname fullwidth katakana カタカナを使用してください")
      end

      it "birthdayが空だと登録できない" do
        @user.birthday = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Birthday can't be blank")
      end
    end
  end
end
