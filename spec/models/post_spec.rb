require 'rails_helper'

RSpec.describe Post, type: :model do
  before do
    @post = FactoryBot.build(:post)
  end
  describe 'Doyalmemo新規投稿' do
    context '投稿を追加できる時' do
      it '画像と説明文があれば投稿できる' do
        expect(@post).to be_valid
      end
      it '画像のみでも投稿できる' do
        @post.text = ""
        expect(@post).to be_valid
      end
      it '説明文のみでも投稿できる' do
        @post.image = nil
        expect(@post).to be_valid
      end
    end
    context '投稿を追加できない時' do
      it '説明文も画像も無ければ投稿ができない' do
        @post.text = ""
        @post.image = nil
        @post.valid?
        expect(@post.errors.full_messages).to include("Text or Image can't be blank")
      end
      it '記事概要が紐づいていないと投稿できない' do
        @post.article = nil
        @post.valid?
        expect(@post.errors.full_messages).to include("Article must exist")
      end
    end
  end
end
