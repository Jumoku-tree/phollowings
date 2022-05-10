class CreateReferences < ActiveRecord::Migration[6.0]
  def change
    create_table :references do |t|
      t.references :work, foreign_key: true
      t.timestamps
    end
  end
end
