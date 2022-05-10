class WorkForm
  include ActiveModel::Model
  attr_accessor(
    :title, :caption, :user_id, :category_id, :tool_id, :images,
    :id, :created_at, :datetime, :updated_at, :datetime
  )
  with_options presence: true do
    validates :title, length: { maximum: 40 }
    validates :category_id, numericality: { other_than: 1, message: "can't be blank" }
    validates :tool_id, numericality: { other_than: 1, message: "can't be blank" }
    validates :images
  end
  validates :caption, length:{ maximum: 2000 }

  def save
    Work.create(title: title, caption: caption, user_id: user_id, category_id: category_id, tool_id: tool_id, images: images)
  end

  def update(params, work)
    work.update(params)
  end
end