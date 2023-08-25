class Genre < ActiveHash::Base
  self.data = [
    { id: 1, name: '---' }, { id: 2, name: '掃除・メンテナンス' }, { id: 3, name: '家具・家電' },
    { id: 4, name: '自転車' }, { id: 5, name: '車・バイク' }, { id: 6, name: '楽器' },
    { id: 7, name: 'PC・スマホ' }, { id: 8, name: 'その他' }, { id: 9, name: 'DIY' }
  ]
  include ActiveHash::Associations
  has_many :user
end
