class Work < ApplicationRecord
  with_options presence: true do
    validates :title
    validates :category_id, numericality: { other_than: 1, message: "can't be blank" }
  end
  has_many_attached :images
  # belongs_to :user
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
end
