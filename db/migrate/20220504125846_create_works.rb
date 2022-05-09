class CreateWorks < ActiveRecord::Migration[6.0]
  def change
    create_table :works do |t|
      t.string :title,        null: false
      t.text :caption
      t.references :user,     null: false, foreign_key: true
      t.integer :category_id, null: false
      t.integer :tool_id, null: false
      t.integer :tool_id2
      t.integer :tool_id3
      t.timestamps
    end
  end
end
