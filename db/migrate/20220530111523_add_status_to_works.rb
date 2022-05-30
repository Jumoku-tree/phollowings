class AddStatusToWorks < ActiveRecord::Migration[6.0]
  def change
    add_column :works, :status, :integer, null: false, default: 0
  end
end
