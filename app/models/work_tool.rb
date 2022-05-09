class WorkTool < ApplicationRecord
  belongs_to :work
  validates :tool_id, presence: true, numericality: { other_than: 1, message: "can't be blank" }

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :tool
end
