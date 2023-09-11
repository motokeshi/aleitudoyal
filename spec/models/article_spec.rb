require 'rails_helper'

RSpec.describe Article, type: :model do
  before do
    @article = FactoryBot.build(:article)
  end
  describe '記事の新規登録' do
    context '記事を新規登録できる時' do
      it 'タイトルが入力されていれば登録できる' do
        expect(@article).to be_valid
      end
    end
    context '記事を新規登録できない時' do
      it 'タイトルが空欄だと登録できない' do
        @article.title = ""
        @article.valid?
        expect(@article.errors.full_messages).to include("Title can't be blank")
      end
      it 'ユーザーが紐づいていないと登録できない' do
        @article.user = nil
        @article.valid?
        expect(@article.errors.full_messages).to include("User must exist")
      end
    end
  end
end
