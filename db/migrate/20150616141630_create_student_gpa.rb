class CreateStudentGpa < ActiveRecord::Migration
  def up
    create_table :student_gpas do |t|
      t.references :student, null: false
      t.string :key, null: false
      t.string :value, null: false
      t.timestamps null: false
    end
    add_index :student_gpas, :student_id
    add_foreign_key :student_gpas, :students, name: "student_gpas_student_id_fk", on_update: :cascade, on_delete: :cascade
  end
  def down
    drop_table :student_gpas
  end
end
