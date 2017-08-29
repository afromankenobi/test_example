class CreateParticipations < ActiveRecord::Migration[5.1]
  def change
    create_table :participations do |t|
      t.references :member, foreign_key: true
      t.references :course, foreign_key: true
      t.index %i[course_id member_id], unique: true
      t.boolean :in_charge

      t.timestamps
    end
  end
end
