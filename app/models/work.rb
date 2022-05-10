class Work < ApplicationRecord
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
