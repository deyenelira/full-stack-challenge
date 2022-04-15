class Book < ApplicationRecord
  has_many :lends
  validates :title, uniqueness: true, presence: true
end
