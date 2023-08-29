class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  validates :name, presence: true, uniqueness: true

  has_many :reminders
  has_one_attached :image, dependent: :destroy

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :genre
end
