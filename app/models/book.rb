class Book < ApplicationRecord
  has_many :books_for_classes
  has_many :courses, through: :books_for_classes
  has_many :media
end
