class Course < ApplicationRecord
  # set up relations
  belongs_to :teacher
  has_many :books_for_classes
  has_many :books, through: :books_for_classes

  # validate information
  validates :name, :section, :teacher_id, :deptName, :course_number, presence: :true
end
