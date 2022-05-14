class RenameUserIdColumnToWorkTools < ActiveRecord::Migration[6.0]
  def change
    rename_column :work_tools, :user_id, :work_id
  end
end
