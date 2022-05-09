class Tool < ActiveHash::Base
  self.data = [
    { id: 1, name: '-使用ツール選択-' },
    { id: 2, name: 'Photoshop' },
    { id: 3, name: 'Illustrator' },
    { id: 4, name: 'CLIP STUDIO PAINT' },
    { id: 5, name: 'ペイントツールSAI' },
    { id: 6, name: 'FireAlpaca' },
    { id: 7, name: 'MediBangPaint PRO' },
    { id: 8, name: 'アイビスペイント' },
    { id: 9, name: 'Procreate' },
    { id: 10, name: '-アナログ-' },
    { id: 11, name: '水彩' },
    { id: 12, name: '油彩' },
    { id: 13, name: '鉛筆' },
    { id: 14, name: 'ボールペン' },
    { id: 15, name: 'コピック' },
    { id: 16, name: 'クレヨン・パステル' },
    { id: 99, name: 'フリーソフト・その他ツール' }
  ]

  include ActiveHash::Associations
  has_many :works
end