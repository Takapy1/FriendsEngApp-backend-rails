class CreateWords < ActiveRecord::Migration[7.0]
  def change
    create_table :words do |t|
      t.integer :line_id, null: false
      t.integer :index_of_line, null: false
      t.string :content, null: false
      t.text :meaning, null: false

      t.timestamps
    end
    add_index :words, [:line_id, :index_of_line], unique: true
    add_foreign_key :words, :lines
  end
end
