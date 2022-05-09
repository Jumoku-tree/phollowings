class AddColumnUserId < ActiveRecord::Migration[6.0]
  def change
    add_column :works, :user_id, :integer
    add_column :works, :work_tools_id, :integer
  end
end
