class Medium < ApplicationRecord
  belongs_to :book, dependent: :destroy
end
