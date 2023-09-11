require 'rails_helper'

RSpec.describe Record, type: :model do
  before do
    @record = FactoryBot.build(:record)
    @record.save
  end
  describe 'レコードの編集' do
    context '編集内容を登録できるとき' do
      it '変更後の履歴が入力されていれば登録できる' do
        @record.implementation_record = Faker::Date.between(from: '2023-10-01', to: '2030-12-31')
        expect(@record).to be_valid
      end
    end
    context '編集内容を登録できない時' do
      it '履歴が空欄になっていると登録できない' do
        @record.implementation_record = nil
        @record.valid?
        expect(@record.errors.full_messages).to include("Implementation record can't be blank")
      end
    end
  end
end
