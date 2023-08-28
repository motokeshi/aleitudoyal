class Reminder < ApplicationRecord
  belongs_to :user
  has_one_attached :image, dependent: :destroy

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :genre
end
