class Post < ApplicationRecord
  belongs_to :article
  has_one_attached :image, dependent: :destroy

  validates :text, presence: {message: "or Image can't be blank"} , unless: :was_attached?

  private

  def was_attached?
    self.image.attached?
  end
end
