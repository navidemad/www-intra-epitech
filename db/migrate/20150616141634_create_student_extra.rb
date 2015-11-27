class CreateStudentExtra < ActiveRecord::Migration
  def up
    create_table :student_extras do |t|
      t.references :student, null: false
      t.string :key, null: false
      t.string :value, null: false
      t.timestamps null: false
    end
    add_index :student_extras, :student_id
    add_foreign_key :student_extras, :students, name: "student_groups_student_id_fk", on_update: :cascade, on_delete: :cascade
  end
  def down
    drop_table :student_extras
  end
end
