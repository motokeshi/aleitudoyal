class Post < ApplicationRecord
  belongs_to :article
  belongs_to :user
  has_one_attached :image, dependent: :destroy
end
