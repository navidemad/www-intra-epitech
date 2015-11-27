class Student < ActiveRecord::Base
  has_many :student_gpas, :dependent => :delete_all
  has_many :student_groups, :dependent => :delete_all
  has_many :student_extras, :dependent => :delete_all
end