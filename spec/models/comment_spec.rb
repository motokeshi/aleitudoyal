require 'rails_helper'

RSpec.describe Comment, type: :model do
  before do
    @comment = FactoryBot.build(:comment)
  end
  describe 'コメント新規投稿' do
    context 'コメントを投稿できる時' do
      it 'テキストがあればコメントを投稿できる' do
        expect(@comment).to be_valid
      end
    end
    context 'コメントを投稿できない時' do
      it 'テキストが無ければコメントを投稿できない' do
        @comment.text = ""
        @comment.valid?
        expect(@comment.errors.full_messages).to include("Text can't be blank")
      end
      it 'ユーザーが紐づいていないと投稿できない' do
        @comment.user = nil
        @comment.valid?
        expect(@comment.errors.full_messages).to include("User must exist")
      end
      it '記事が紐づいていないと投稿できない' do
        @comment.article = nil
        @comment.valid?
        expect(@comment.errors.full_messages).to include("Article must exist")
      end
    end
  end
end
