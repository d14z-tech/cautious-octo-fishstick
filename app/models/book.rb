class Book < ApplicationRecord
  belongs_to :user

  validates :title, presence: true, uniqueness: true
  validates :cost, numericality: { greater_than_or_equal_to: 0 }
end
