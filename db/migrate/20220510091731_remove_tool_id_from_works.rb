class RemoveToolIdFromWorks < ActiveRecord::Migration[6.0]
  def change
    remove_column :works, :tool_id2
    remove_column :works, :tool_id3
  end
end
