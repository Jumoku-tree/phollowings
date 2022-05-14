class AddToolIdToWorks < ActiveRecord::Migration[6.0]
  def change
    add_column :works, :tool_id, :integer
  end
end
