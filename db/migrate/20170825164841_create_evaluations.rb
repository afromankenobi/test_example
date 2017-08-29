class CreateEvaluations < ActiveRecord::Migration[5.1]
  def change
    create_table :evaluations do |t|
      t.references :test, foreign_key: true
      t.references :member, foreign_key: true
      t.float :score
      t.index %i[test_id member_id], unique: true
      t.timestamps
    end
  end
end
