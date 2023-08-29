class Article < ApplicationRecord
  belongs_to :user
  belongs_to :reminder
  belongs_to :genre
  has_one_attached :image, dependent: :destroy
end
