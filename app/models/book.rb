class Book < ApplicationRecord
  has_many :books_for_classes
  has_many :courses, through: :books_for_classes
  has_many :media, inverse_of: :book

  # allows for nested form
  accepts_nested_attributes_for :media, allow_destroy: true,
      reject_if: :all_blank
end
