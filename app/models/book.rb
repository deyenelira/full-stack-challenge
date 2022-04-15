class Book < ApplicationRecord
  has_many :lends
  validates :name, uniqueness: true, presence: true
end
