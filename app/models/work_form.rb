class WorkForm
  include ActiveModel::Model
  attr_accessor(
    :title, :caption, :user_id, :category_id, :tool_id, :images,
    :id, :created_at, :datetime, :updated_at, :datetime,
    :tag_name
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
    tag = Tag.where(tag_name: tag_name).first_or_initialize
    tag.save
    WorkTagRelation.create(work_id: work.id, tag_id: tag.id)
  end

  def update(params, work)
    work.work_tag_relations.destroy_all
    tag_name = params.delete(:tag_name)
    tag = Tag.where(tag_name: tag_name).first_or_initialize if tag_name.present?
    tag.save if tag_name.present?
    work.update(params)
    WorkTagRelation.create(work_id: work.id, tag_id: tag.id) if tag_name.present?
  end
end