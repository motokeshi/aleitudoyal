class Article < ApplicationRecord
  belongs_to :user
  has_many :posts, dependent: :destroy
  has_many :comments
  has_one_attached :image, dependent: :destroy

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :genre

end
