class Post < ApplicationRecord
  belongs_to :article
  belongs_to :user
  has_one_attached :image, dependent: :destroy

  validates :text, presence: true, unless: :was_attached?

  private

  def was_attached?
    self.image.attached?
  end
end
