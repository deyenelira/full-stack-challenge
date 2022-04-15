class Book < ApplicationRecord
  has_many :lends, dependent: :destroy
  validates :name, uniqueness: true, presence: true
  validates :author, presence: true
end
