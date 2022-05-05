class Category < ActiveHash::Base
  include ActiveHash::Associations
  self.data = [
    { id: 1, name: '---' },
    { id: 2, name: '加工' },
    { id: 3, name: 'セルフリメイク' },
    { id: 4, name: 'おすすめツール' },
    { id: 5, name: '○○してみた' },
    { id: 6, name: '○○してくれ' },
    { id: 7, name: 'その他' }
  ]

  has_many :posts
end