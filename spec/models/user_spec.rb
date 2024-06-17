require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録' do
    it 'nicknameが空では登録できない' do
      @user.nickname = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Nickname can't be blank")
    end

    it 'emailが空では登録できない' do
      @user.email = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Email can't be blank")
    end

    it 'passwordが空だと登録できない' do
      @user.password = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Password can't be blank")
    end

    it 'passwordが5文字以下だと登録できない。' do
      @user.password = 'a1234'
      @user.valid?
      expect(@user.errors.full_messages).to include('Password is too short (minimum is 6 characters)')
    end

    it 'passwordが半角英語だけだと登録できない' do
      @user.password = 'abcdef'
      @user.valid?
      expect(@user.errors.full_messages).to include('Password は半角英字と半角数字それぞれを含めて設定してください')
    end

    it 'passwordが半角数字だけだと登録できない' do
      @user.password = '123456'
      @user.valid?
      expect(@user.errors.full_messages).to include('Password は半角英字と半角数字それぞれを含めて設定してください')
    end

    it 'passwordとpasswpord_confirmationが異なる場合登録できない' do
      @user.password = 'a12345'
      @user.password_confirmation = 'b12345'
      @user.valid?
      expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
    end

    it '名前(名字)がないと登録できない' do
      @user.family_name_kanji = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Family name kanji can't be blank")
    end

    it '名前(名前)がないと登録できない' do
      @user.first_name_kanji = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("First name kanji can't be blank")
    end

    it '名前(名字)が半角だと登録できない' do
      @user.family_name_kanji = 'abc'
      @user.valid?
      expect(@user.errors.full_messages).to include('Family name kanji は全角で入力してください')
    end

    it '名前(名前)が半角だと登録できない' do
      @user.first_name_kanji = 'abc'
      @user.valid?
      expect(@user.errors.full_messages).to include('First name kanji は全角で入力してください')
    end

    it '名前(名字：カナ)がないと登録できない' do
      @user.family_name_kana = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Family name kana can't be blank")
    end

    it '名前(名前：カナ)がないと登録できない' do
      @user.first_name_kana = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("First name kana can't be blank")
    end

    it '名前(名字：カナ)がカタカナでないと登録できない' do
      @user.family_name_kana = 'やまだ'
      @user.valid?
      expect(@user.errors.full_messages).to include('Family name kana は全角カタカナで入力してください')
    end

    it '名前(名前：カナ)がカタカナでないと登録できない' do
      @user.first_name_kana = 'りくたろう'
      @user.valid?
      expect(@user.errors.full_messages).to include('First name kana は全角カタカナで入力してください')
    end

    it '生年月日がないと登録できないこと' do
      @user.birthday = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Birthday can't be blank")
    end
  end
end
