class Book < ApplicationRecord
  belongs_to :user
  has_many :quotes, dependent: :destroy

  accepts_nested_attributes_for :quotes, allow_destroy: true

  validates :title, presence: true, uniqueness: true
  validates :cost, numericality: { greater_than_or_equal_to: 0 }
  validates :page, numericality: { allow_nil: true, greater_than_or_equal_to: 0 }
end
