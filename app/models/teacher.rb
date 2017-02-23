class Teacher < ApplicationRecord
  has_many :courses
  # adds encryption and related security
  # checks to teacher passwords
  has_secure_password

  # validations to ensure data integrity
  validates :password, length: { minimum: 6 }, allow_nil: true
  validates :name, :department, :admin, presence: :true
  validates :email, :format => {:with => /^.+@.+$/, :message =>
      "Please enter a valid email address! ie. john@example.com "}
end
