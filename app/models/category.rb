class Category < ActiveHash::Base
  self.data = [
    { id: 1, name: '-カテゴリー選択-' },
    { id: 2, name: '加工' },
    { id: 3, name: 'ツール紹介' },
    { id: 4, name: 'セルフリメイク' },
    { id: 5, name: 'とりあえず見て' },
    { id: 6, name: '○○してみた' },
    { id: 7, name: '○○してくれ' },
    { id: 8, name: 'その他' }
  ]
  
  include ActiveHash::Associations
  has_many :works
end