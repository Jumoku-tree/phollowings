class CreateWorkTools < ActiveRecord::Migration[6.0]
  def change
    create_table :work_tools do |t|
      t.references :work,   null: false, foreign_key: true
      t.integer :tool_id,   null: false
      t.integer :tool_id_2,   null: false
      t.integer :tool_id_3,   null: false
      t.timestamps
    end
  end
end
