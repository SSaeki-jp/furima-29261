require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザ管理機能' do
    context '新規登録がうまくいくとき' do
      it '全カラムの情報が存在するとき登録できる' do
        expect(@user).to be_valid
      end
      it 'passwordが6文字以上のとき登録できる' do
        @user.password = '123asd'
        @user.password_confirmation = '123asd'
        expect(@user).to be_valid
      end
    end

    context '新規登録がうまくいかないとき' do
      it 'nicknameが空だと登録できない' do
        @user.nickname = ''
        @user.valid?
        expect(@user.errors.full_messages).to include('ニックネームを入力してください')
      end

      it 'emailが空だと登録できない' do
        @user.email = ''
        @user.valid?
        expect(@user.errors.full_messages).to include('Eメールを入力してください')
      end
      it 'emailに@が含まれていないと登録できない' do
        @user.email = 'sample'
        @user.valid?
        expect(@user.errors.full_messages).to include('Eメールは不正な値です')
      end
      it '重複したemailが存在する場合登録できない' do
        @user.save
        another_user = FactoryBot.build(:user)
        another_user.email = @user.email
        another_user.valid?
        expect(another_user.errors.full_messages).to include('Eメールはすでに存在します')
      end

      it 'passwordが空だと登録できない' do
        @user.password = ''
        @user.valid?
        expect(@user.errors.full_messages).to include('パスワードを入力してください')
      end
      it 'passwordが英数字混合でないと登録できない' do
        @user.password = '123456'
        @user.password_confirmation = '123456'
        @user.valid?
        expect(@user.errors.full_messages).to include('パスワードは英数字混在で入力してください')
      end
      it 'passwordが5文字以下だと登録できない' do
        @user.password = '123as'
        @user.password_confirmation = '123as'
        @user.valid?
        expect(@user.errors.full_messages).to include('パスワードは6文字以上で入力してください')
      end
      it 'passwordが存在してもpassword_confirmationが空だと登録できない' do
        @user.password_confirmation = ''
        @user.valid?
        expect(@user.errors.full_messages).to include('パスワード（確認用）とパスワードの入力が一致しません')
      end

      it 'lastname_fullwidth_kanjiが空だと登録できない' do
        @user.lastname_fullwidth_kanji = ''
        @user.valid?
        expect(@user.errors.full_messages).to include('お名前（全角）姓を入力してください')
      end
      it 'lastname_fullwidth_kanjiが半角文字だと登録できない' do
        @user.lastname_fullwidth_kanji = 'aaaa'
        @user.valid?
        expect(@user.errors.full_messages).to include('お名前（全角）姓は不正な値です')
      end

      it 'firstname_fullwidth_kanjiが空だと登録できない' do
        @user.firstname_fullwidth_kanji = ''
        @user.valid?
        expect(@user.errors.full_messages).to include('お名前（全角）名を入力してください')
      end
      it 'firstname_fullwidth_kanjiが半角文字だと登録できない' do
        @user.firstname_fullwidth_kanji = 'bbbb'
        @user.valid?
        expect(@user.errors.full_messages).to include('お名前（全角）名は不正な値です')
      end

      it 'lastname_fullwidth_katakanaが空だと登録できない' do
        @user.lastname_fullwidth_katakana = ''
        @user.valid?
        expect(@user.errors.full_messages).to include('お名前カナ（全角）姓を入力してください')
      end
      it 'lastname_fullwidth_katakanaが半角文字だと登録できない' do
        @user.lastname_fullwidth_katakana = 'cccc'
        @user.valid?
        expect(@user.errors.full_messages).to include('お名前カナ（全角）姓は不正な値です')
      end
      it 'lastname_fullwidth_katakanaがカタカナ以外の全角文字だと登録できない' do
        @user.lastname_fullwidth_katakana = '一二三'
        @user.valid?
        expect(@user.errors.full_messages).to include('お名前カナ（全角）姓は不正な値です')
      end

      it 'firstname_fullwidth_katakanaが空だと登録できない' do
        @user.firstname_fullwidth_katakana = ''
        @user.valid?
        expect(@user.errors.full_messages).to include('お名前カナ（全角）名を入力してください')
      end
      it 'firstname_fullwidth_katakanaが半角文字だと登録できない' do
        @user.firstname_fullwidth_katakana = 'dddd'
        @user.valid?
        expect(@user.errors.full_messages).to include('お名前カナ（全角）名は不正な値です')
      end
      it 'firstname_fullwidth_katakanaがカタカナ以外の全角文字だと登録できない' do
        @user.firstname_fullwidth_katakana = '四五六'
        @user.valid?
        expect(@user.errors.full_messages).to include('お名前カナ（全角）名は不正な値です')
      end

      it 'birthdayが空だと登録できない' do
        @user.birthday = ''
        @user.valid?
        expect(@user.errors.full_messages).to include('生年月日を入力してください')
      end
    end
  end
end
