class Work < ApplicationRecord
  has_many_attached :images
  belongs_to :user
  has_many :likes, dependent: :destroy
  has_many :work_tag_relations
  has_many :tags, through: :work_tag_relations

  # いいねされているかどうか判定するメソッド
  def liked?(user)
    likes.where(user_id: user.id).exists?
  end

  # アクティブハッシュ用
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :tool
end
