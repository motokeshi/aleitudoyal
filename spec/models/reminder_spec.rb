require 'rails_helper'

RSpec.describe Reminder, type: :model do
  before do
    @reminder = FactoryBot.build(:reminder)
  end
  describe 'リマインダー新規登録' do
    context 'リマインダーを登録できる時' do
      it 'タイトル、頻度、初回スケジュールが入力されていれば登録できる' do
        expect(@reminder).to be_valid
      end
      it '頻度が日のみの入力でも登録できる' do
        @reminder.frequency_week = 0
        @reminder.frequency_month = 0
        @reminder.frequency_year = 0
        expect(@reminder).to be_valid
      end
      it '頻度が週のみの入力でも登録できる' do
        @reminder.frequency_day = 0
        @reminder.frequency_month = 0
        @reminder.frequency_year = 0
        expect(@reminder).to be_valid
      end
      it '頻度が月のみの入力でも登録できる' do
        @reminder.frequency_day = 0
        @reminder.frequency_week = 0
        @reminder.frequency_year = 0
        expect(@reminder).to be_valid
      end
      it '頻度が年のみの入力でも登録できる' do
        @reminder.frequency_day = 0
        @reminder.frequency_week = 0
        @reminder.frequency_month = 0
        expect(@reminder).to be_valid
      end
    end
    context 'リマインダーを登録できない時' do
      it 'タイトルが空欄だと登録できない' do
        @reminder.title = ""
        @reminder.valid?
        expect(@reminder.errors.full_messages).to include("Title can't be blank")
      end
      it '初回スケジュールが空欄だと登録できない' do
        @reminder.schedule = nil
        @reminder.valid?
        expect(@reminder.errors.full_messages).to include("Schedule can't be blank")
      end
      it '頻度が年、月、週、日全て0だと登録できない' do
        @reminder.frequency_year = 0
        @reminder.frequency_month = 0
        @reminder.frequency_week = 0
        @reminder.frequency_day = 0
        @reminder.valid?
        expect(@reminder.errors.full_messages).to include("Frequency day or week or month or year can't be 0")
      end
    end
  end
end
