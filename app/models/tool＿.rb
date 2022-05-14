class Tool < ApplicationRecord
  has_many :works, through: :work_tools
  has_many :work_tool
end
