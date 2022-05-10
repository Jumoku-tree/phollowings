class Work < ApplicationRecord
  with_options presence: true do
    validates :title, length: { maximum: 40 }
    validates :category_id, numericality: { other_than: 1, message: "can't be blank" }
    validates :tool_id, numericality: { other_than: 1, message: "can't be blank" }
    validates :tool_id2
    validates :tool_id3
    validates :images
  end
  validates :caption, length:{ maximum: 2000 }

  has_many_attached :images
  belongs_to :user
  has_many :likes, dependent: :destroy

  def liked?(user)
    likes.where(user_id: user.id).exists?
  end

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :tool
end
