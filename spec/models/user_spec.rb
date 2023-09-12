require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end
  describe 'ユーザー新規登録' do
    context '新規登録できるとき' do
      it 'ユーザー名、メールアドレス、パスワード、パスワード確認が記載されていると登録できる' do
        expect(@user).to be_valid
      end
    end
    context '新規登録できない時' do
      it 'ユーザー名が空欄だと登録できない' do
        @user.name = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Name can't be blank")
      end
      it 'ユーザー名が既に使われていると登録できない' do
        @user.save
        @user2 = FactoryBot.build(:user, name: @user.name)
        @user2.valid?
        expect(@user2.errors.full_messages).to include("Name has already been taken")
      end
      it 'ユーザー名が41文字以上だと登録できない' do
        @user.name = Faker::Lorem.characters(number: 41)
        @user.valid?
        expect(@user.errors.full_messages).to include("Name is too long (maximum is 40 characters)")
      end
      it 'メールアドレスが空欄だと登録できない' do
        @user.email = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Email can't be blank")
      end
      it 'メールアドレスが既に使われていると登録できない' do
        @user.save
        @user2 = FactoryBot.build(:user, email: @user.email)
        @user2.valid?
        expect(@user2.errors.full_messages).to include("Email has already been taken")
      end
      it 'メールアドレスに@が含まれていないと登録できない' do
        @user.email = 'test.com'
        @user.valid?
        expect(@user.errors.full_messages).to include("Email is invalid")
      end
      it 'パスワードが空欄だと登録できない' do
        @user.password = ""
        @user.password_confirmation = @user.password
        @user.valid?
        expect(@user.errors.full_messages).to include("Password can't be blank")
      end
      it 'パスワードが6文字未満だと登録できない' do
        @user.password = "12345"
        @user.password_confirmation = @user.password
        @user.valid?
        expect(@user.errors.full_messages).to include("Password is too short (minimum is 6 characters)")
      end
      it 'パスワードが129文字以上だと登録できない' do
        @user.password = Faker::Internet.password(min_length: 129, max_length: 135)
        @user.password_confirmation = @user.password
        @user.valid?
        expect(@user.errors.full_messages).to include("Password is too long (maximum is 128 characters)")
      end
      # deviseの機能を使ってユーザー更新ページを実装するまで、下のテスト項目は保留。
      # it 'パスワードに半角英数以外の文字が含まれていると登録できない' do
      #   @user.password = "12345Ａ"
      #   @user.password_confirmation = @user.password
      #   @user.valid?
      #   expect(@user.errors.full_messages).to include("Password is invalid")
      # end
      it 'パスワードとパスワード（確認用）が一致していないと登録できない' do
        @user.password = "123456"
        @user.password_confirmation = "111111"
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end
    end
  end
end
