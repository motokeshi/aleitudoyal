class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  validates :name, presence: true, uniqueness: true, length: { maximum: 40 }
  # deviseの機能を使って、ユーザー更新ページを実装する。
  # ユーザー登録時のパスワード欄に半角英数以外の文字をコピペして登録できてしまう。
  # パスワードにバリデーションを設定すると、現状ではユーザー情報が更新できなくなってしまう。
  validates :password, format: { with: /\A[a-z\d]+\z/i }, on: :create

  has_many :reminders, dependent: :destroy
  has_many :articles , dependent: :destroy
  has_many :comments,  dependent: :destroy
  has_one_attached :image, dependent: :destroy

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :genre
end
