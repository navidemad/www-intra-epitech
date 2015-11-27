class CreateStudent < ActiveRecord::Migration
  def up
    create_table :students do |t|
      t.integer :uid
      t.string :login, null: false, limit: 6, unique: true
      t.string :lastname, limit: 32
      t.string :firstname, limit: 32
      t.string :picture, limit: 128
      t.string :location, limit: 16
      t.integer :promo
      t.integer :studentyear
      t.integer :credits
      t.datetime :crawled_at
      #t.references :student_group
      #t.references :student_gpa
      #t.references :student_extra
    end
    add_index :students, :login, :unique => true
  end
  def down
    drop_table :students
  end
end
