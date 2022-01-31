class CreateLines < ActiveRecord::Migration[7.0]
  def change
    create_table :lines do |t|
      t.text :content, null: false
      t.references :episode, null: false, foreign_key: true

      t.timestamps
    end
  end
end
