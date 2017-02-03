class Course < ApplicationRecord
  belongs_to :teacher
  has_many :books, through: :books_for_classes
end
