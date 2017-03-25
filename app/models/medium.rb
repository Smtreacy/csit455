class Medium < ApplicationRecord
  belongs_to :book, inverse_of: :media, dependent: :destroy
end
