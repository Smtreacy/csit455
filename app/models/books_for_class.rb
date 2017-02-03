class BooksForClass < ApplicationRecord
  belongs_to :book
  belongs_to :course
end
