class Post < ApplicationRecord
  belongs_to :article
  has_one_attached :image, dependent: :destroy
end
