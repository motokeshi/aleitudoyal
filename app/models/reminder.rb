class Reminder < ApplicationRecord
  belongs_to :user
  has_many :records, dependent: :destroy
  has_many :reminder_articles, dependent: :destroy
  has_many :articles, through: :reminder_articles
  has_one_attached :image, dependent: :destroy

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :genre

  validates :title, presence: true
  validates :schedule, presence: true
  validates :frequency_day, numericality: {greater_than: 0, message: "or week or month or year can't be 0"}, unless: :frequency_input?

  def next_schedule_calculation(schedule, frequency_year, frequency_month, frequency_week, frequency_day)
    if frequency_year > 0
      schedule = schedule >> (frequency_year * 12)
    end
    if frequency_month > 0
      schedule = schedule >> frequency_month
    end
    if frequency_week > 0
      schedule = schedule + (frequency_week * 7)
    end
    if frequency_day > 0
      schedule = schedule + frequency_day
    end
    return schedule
  end

  def self.reminders_search(user_id, search)
    if search != ""
      Reminder.where(user_id: user_id).where('title LIKE(?)', "%#{search}%")
    else
      Reminder.where(user_id: user_id)
    end
  end

  def frequency_input?
    frequency = self.frequency_year + self.frequency_month + self.frequency_week + self.frequency_day
    return frequency > 0
  end
end
