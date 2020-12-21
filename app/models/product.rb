class Product < ApplicationRecord
  include ProductUtils

  has_many :orders, through: :line_items
  has_many :line_items
  before_destroy :ensure_not_referenced_by_any_line_item

  validates :title, :description, presence: true, length: { minimum: 10 }
  validates :price, numericality: { greater_than_or_equal_to: 0.01, message: 'Price is invalid.' }
  validates :title, uniqueness: true
  validates :image_url, format: { with: %r{\.(gif|jpg|png)\z}i,
                                                     message: 'must be a URL for GIF, JPG or PNG image.'
  }
end
