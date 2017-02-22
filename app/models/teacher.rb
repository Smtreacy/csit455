class Teacher < ApplicationRecord
  has_many :courses
  # adds encryption and related security
  # checks to teacher passwords
  has_secure_password
  validates :password, length: { minimum: 6 }, allow_nil: true
end
