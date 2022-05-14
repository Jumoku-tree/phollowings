class WorkForm
  include ActiveModel::Model
  attr_accessor(
    :title, :caption, :user_id, :tool_id, :category_id, :images,
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

  def save(tags)
    work = Work.create(title: title, caption: caption, user_id: user_id, category_id: category_id, tool_id: tool_id, images: images)
    work_tags = []
    tags.each do |tag|
      work_tags << tag[:id]
    end
    work_tags.each do |work_tag|
      WorkTagRelation.create(work_id: work.id, tag_id: work_tag)
    end

  end

  def update(params, work)
    work.work_tag_relations.destroy_all
    tag_name = params.delete(:tag_name)
    tag = Tag.where(tag_name: tag_name).first_or_initialize if tag_name.present?
    tags.save if tag_name.present?
    work.update(params)
    WorkTagRelation.create(work_id: work.id, tag_id: tag.id) if tag_name.present?
  end

end
