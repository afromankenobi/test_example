class CreateTests < ActiveRecord::Migration[5.1]
  def change
    create_table :tests do |t|
      t.references :course, foreign_key: true, null: false
      t.text :content

      t.timestamps
    end
  end
end
