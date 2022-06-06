class WorkForm
  include ActiveModel::Model
  attr_accessor(
    :title, :caption, :user_id, :tool_id, :category_id, :status, :images,
    :id, :created_at, :datetime, :updated_at, :datetime,
    :tag_name
  )
  with_options presence: true do
    validates :user_id
    validates :title, length: { maximum: 40 }
    validates :category_id, numericality: { other_than: 1, message: "can't be blank" }
    validates :tool_id, numericality: { other_than: 1, message: "can't be blank" }
    validates :images, length: {maximum: 2, message: "must be attached whitin 2"}
  end
  validates :caption, length:{ maximum: 2000 }

  def save(tags)
    work = Work.create(title: title, caption: caption, user_id: user_id, category_id: category_id, tool_id: tool_id, status: status, images: images)
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
    tag_names = tag_name.split(",")
    tags = []
    if tag_names.present?
      tag_names.each do |tag_name|
        tag = Tag.where(tag_name: tag_name).first_or_initialize
        tags << tag
      end
      tags.each do |tag|
        tag.save
      end
    end
    work.update(params)
    if tag_names.present?
      tags.each do |tag|
        WorkTagRelation.create(work_id: work.id, tag_id: tag.id)
      end
    end
  end
end
