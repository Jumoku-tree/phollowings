class ChangePostsToWorks < ActiveRecord::Migration[6.0]
  def change
    rename_table :posts, :works
  end
end
